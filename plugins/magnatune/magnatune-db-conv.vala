/* magnatune-db-reader.vala
 *
 * Copyright (C) 2012  Jörn Magens
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  The Xnoise authors hereby grant permission for non-GPL compatible
 *  GStreamer plugins to be used and distributed together with GStreamer
 *  and Xnoise. This permission is above and beyond the permissions granted
 *  by the GPL license by which Xnoise is covered. If you modify this code
 *  you may extend this exception to your version of the code, but you are not
 *  obligated to do so. If you do not wish to do so, delete this exception
 *  statement from your version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA.
 *
 * Author:
 *     Jörn Magens
 */


using Sqlite;

using Xnoise;
using Xnoise.Services;

public class MagnatuneDatabaseConverter : GLib.Object {
    private const string DATABASE_NAME = "/tmp/xnoise_magnatune_db";
    private const string TARGET_DB     = "/tmp/xnoise_magnatune.sqlite";
    private string DATABASE;

    // SQL
    private static const string STMT_CREATE_ARTISTS =
        "CREATE TABLE artists (id INTEGER PRIMARY KEY, name TEXT);";
    private static const string STMT_CREATE_ALBUMS =
        "CREATE TABLE albums (id INTEGER PRIMARY KEY, artist INTEGER, name TEXT, image TEXT);";
    private static const string STMT_CREATE_URIS =
        "CREATE TABLE uris (id INTEGER PRIMARY KEY, name TEXT, type INTEGER);";
    private static const string STMT_CREATE_GENRES =
        "CREATE TABLE genres (id integer primary key, name TEXT);";
    private static const string STMT_CREATE_ITEMS =
        "CREATE TABLE items (id INTEGER PRIMARY KEY, tracknumber INTEGER, artist INTEGER, album INTEGER, title TEXT, genre INTEGER, year INTEGER, uri INTEGER, mediatype INTEGER, length INTEGER, bitrate INTEGER, usertags TEXT, playcount INTEGER, rating INTEGER, lastplayTime DATETIME, addTimeUnix INTEGER, mimetype TEXT);";
    private static const string STMT_BEGIN =
        "BEGIN";
    private static const string STMT_COMMIT =
        "COMMIT";
    private static const string STMT_CHECK_TRACK_EXISTS =
        "SELECT t.id FROM items t, uris u WHERE t.uri = u.id AND u.name = ?";
    private static const string STMT_INSERT_ARTIST =
        "INSERT INTO artists (name) VALUES (?)";
    private static const string STMT_INSERT_ALBUM =
        "INSERT INTO albums (artist, name) VALUES (?, ?)";
    private static const string STMT_GET_URI_ID =
        "SELECT id FROM uris WHERE name = ?";
    private static const string STMT_INSERT_URI =
        "INSERT INTO uris (name) VALUES (?)";
    private static const string STMT_GET_GENRE_ID =
        "SELECT id FROM genres WHERE utf8_lower(name) = ?";
    private static const string STMT_INSERT_GENRE =
        "INSERT INTO genres (name) VALUES (?)";
    private static const string STMT_GET_TITLE_ID =
        "SELECT id FROM items WHERE artist = ? AND album = ? AND utf8_lower(title) = ?";

    private Statement begin_statement;
    private Statement commit_statement;
    private Statement get_artist_id_statement;
    private Statement insert_artist_statement;
    private Statement get_album_id_statement;
    private Statement insert_album_statement;
    private Statement get_uri_id_statement;
    private Statement insert_uri_statement;
    private Statement get_genre_id_statement;
    private Statement insert_genre_statement;
    private Statement insert_title_statement;
    private Statement get_title_id_statement;


    public MagnatuneDatabaseConverter() {
        var ft = File.new_for_path(TARGET_DB);
        if(ft.query_exists(null))
            ft.delete();

        if(ft.query_exists(null))
            printerr("target file is still there\n");
        DATABASE = dbFileName();
        source = null;
        if(Sqlite.Database.open_v2(DATABASE, out source, Sqlite.OPEN_READONLY, null)!=Sqlite.OK) {
            error("Can't open magnatune database: %s\n", (string)this.source.errmsg);
        }
        if(this.source == null) {
            error("magnatune db failed");
        }
        
        bool ret = create_target_db();
        assert(ret == true);
        
        prepare_target_statements();
    }

    private void prepare_target_statements() {
        this.target.create_function_v2("utf8_lower", 1, Sqlite.ANY, null, utf8_lower, null, null, null);
        
        this.target.prepare_v2(STMT_BEGIN, -1, out this.begin_statement);
        this.target.prepare_v2(STMT_COMMIT, -1, out this.commit_statement);
        this.target.prepare_v2(STMT_GET_ARTIST_ID, -1, out this.get_artist_id_statement);
        this.target.prepare_v2(STMT_INSERT_ARTIST, -1, out this.insert_artist_statement);
        this.target.prepare_v2(STMT_GET_ALBUM_ID, -1, out this.get_album_id_statement);
        this.target.prepare_v2(STMT_INSERT_ALBUM, -1, out this.insert_album_statement);
        this.target.prepare_v2(STMT_GET_URI_ID, -1, out this.get_uri_id_statement);
        this.target.prepare_v2(STMT_INSERT_URI, -1, out this.insert_uri_statement);
        this.target.prepare_v2(STMT_GET_GENRE_ID, -1, out this.get_genre_id_statement);
        this.target.prepare_v2(STMT_INSERT_GENRE, -1, out this.insert_genre_statement);
        this.target.prepare_v2(STMT_INSERT_TITLE, -1, out this.insert_title_statement);
        this.target.prepare_v2(STMT_GET_TITLE_ID, -1, out this.get_title_id_statement);
    }

    public void move_data() {
        get_source_tracks();
        return;
    }
    

    private static const string STMT_GET_TRACKS =
        "SELECT DISTINCT s.desc, s.mp3, s.number, ar.artist, s.albumname, g.genre, al.launchdate, s.duration FROM artists ar, albums al, songs s, genres g WHERE s.albumname = al.albumname AND al.artist = ar.artist AND g.albumname = al.albumname";

    private void get_source_tracks() {
        Statement stmt;
        this.source.prepare_v2(STMT_GET_TRACKS, -1, out stmt);
        while(stmt.step() == Sqlite.ROW) {
            TrackData td = new TrackData();
            Item? i = Item(ItemType.STREAM);
            td.item = i;
            td.item.uri  = "http://he3.magnatune.com/all/" + Uri.escape_string(stmt.column_text(1), null, true);
            td.title = td.item.text = stmt.column_text(0);
            td.tracknumber = stmt.column_int(2);
            td.artist = stmt.column_text(3);
            td.album = stmt.column_text(4);
            td.genre = stmt.column_text(5);
            if(stmt.column_int(6) != 0) {
                DateTime dt = new DateTime.from_unix_utc(stmt.column_int(6));
                td.year = dt.get_year();
            }
            if(stmt.column_int(7) > 0) {
                td.length = stmt.column_int(7);
            }
            
            // INSERT
            insert_title(ref td);
        }
    }


    private bool create_target_db() {
        setup_target_handle();
        if(target == null)
            return false;
        //use a db structure similar to xnoise's
        if(!exec_stmnt_string(STMT_CREATE_ARTISTS)        ) { return false; }
        if(!exec_stmnt_string(STMT_CREATE_ALBUMS)         ) { return false; }
        if(!exec_stmnt_string(STMT_CREATE_URIS)           ) { return false; }
        if(!exec_stmnt_string(STMT_CREATE_ITEMS)          ) { return false; }
        if(!exec_stmnt_string(STMT_CREATE_GENRES)         ) { return false; }
        
        return true;
    }

    private bool exec_stmnt_string(string statement) {
        string errormsg;
        if(target.exec(statement, null, out errormsg)!= Sqlite.OK) {
            stderr.printf("exec_stmnt_string error: %s", errormsg);
            return false;
        }
        return true;
    }
    
    private void setup_target_handle() {
        File tf = File.new_for_path(TARGET_DB);
        if(!tf.query_exists(null)) {
            try {
                tf.delete();
                //xnoise_home.make_directory_with_parents(null);
            }
            catch(Error e) {
                print("%s\n", e.message);
            }
        }
        Sqlite.Database.open_v2(tf.get_path(),
                                out this.target,
                                Sqlite.OPEN_CREATE|Sqlite.OPEN_READWRITE,
                                null
                                );
    }

    private static void utf8_lower(Sqlite.Context context, [CCode (array_length_pos = 1.1)] Sqlite.Value[] values) {
        context.result_text(values[0].to_text().down());
    }
    
    private Sqlite.Database source;
    private Sqlite.Database target;

    private string dbFileName() {
        return DATABASE_NAME;//GLib.Path.build_filename("tmp", "xnoise_magnatune_db", null);
    }

    private void db_error(ref Sqlite.Database x) {
        print("Database error %d: %s \n\n", x.errcode(), x.errmsg());
    }

    private static const string STMT_GET_GET_ITEM_ID = 
        "SELECT id FROM items WHERE artist = ? AND album = ? AND title = ?";
    
    private static const string STMT_INSERT_TITLE =
        "INSERT INTO items (tracknumber, artist, album, title, genre, year, uri, mediatype, length, bitrate, mimetype) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    private static const string STMT_GET_ITEM_ID =
        "SELECT t.id FROM items t, uris u WHERE t.uri = u.id AND u.id = ?";
    
    public bool insert_title(ref TrackData td) { // , string uri
        // make entries in other tables and get references from there
        td.dat1 = handle_artist(ref td.artist);
        if(td.dat1 == -1) {
            print("Error importing artist for %s : '%s' ! \n", td.item.uri, td.artist);
            return false;
        }
        td.dat2 = handle_album(ref td.dat1, ref td.album);
        if(td.dat2 == -1) {
            print("Error importing album for %s : '%s' ! \n", td.item.uri, td.album);
            return false;
        }
        int uri_id = handle_uri(td.item.uri);
        if(uri_id == -1) {
            //print("Error importing uri for %s : '%s' ! \n", uri, uri);
            return false;
        }
        int genre_id = handle_genre(ref td.genre);
        if(genre_id == -1) {
            print("Error importing genre for %s : '%s' ! \n", td.item.uri, td.genre);
            return false;
        }
        //print("insert_title td.item.type %s\n", td.item.type.to_string());
        insert_title_statement.reset();
        if(insert_title_statement.bind_int (1,  (int)td.tracknumber) != Sqlite.OK ||
           insert_title_statement.bind_int (2,  td.dat1)             != Sqlite.OK ||
           insert_title_statement.bind_int (3,  td.dat2)             != Sqlite.OK ||
           insert_title_statement.bind_text(4,  td.title)            != Sqlite.OK ||
           insert_title_statement.bind_int (5,  genre_id)            != Sqlite.OK ||
           insert_title_statement.bind_int (6,  (int)td.year)        != Sqlite.OK ||
           insert_title_statement.bind_int (7,  uri_id)              != Sqlite.OK ||
           insert_title_statement.bind_int (8,  td.item.type)        != Sqlite.OK ||
           insert_title_statement.bind_int (9,  td.length)           != Sqlite.OK
           ) {
            this.db_error(ref target);
            return false;
        }
        
        if(insert_title_statement.step()!=Sqlite.DONE) {
            this.db_error(ref target);
            return false;
        }
//        if(td.item.type == ItemType.LOCAL_VIDEO_TRACK) {
//            Statement stmt;
//            this.target.prepare_v2(STMT_GET_ITEM_ID , -1, out stmt);
//            if(stmt.bind_int (1,uri_id) != Sqlite.OK) {
//                this.db_error(ref target);
//                return false;
//            }
//            int32 idv = -1;
//            if(stmt.step() == Sqlite.ROW) {
//                idv = (int32)stmt.column_int(0);
//            }
//            else {
//                this.db_error(ref target);
//                return false;
//            }
//        }
        return true;
    }


    private static const string STMT_GET_ARTIST_ID =
        "SELECT id FROM artists WHERE utf8_lower(name) = ?";
    private static const string STMT_UPDATE_ARTIST_NAME = 
        "UPDATE artists SET name=? WHERE id=?";
    private int handle_artist(ref string artist, bool update_artist = false) {
        // find artist, if available or create entry_album
        // return id for artist
        int artist_id = -1;
        get_artist_id_statement.reset();
        if(get_artist_id_statement.bind_text(1, (artist != null ? artist.down().strip() : EMPTYSTRING)) != Sqlite.OK) {
            this.db_error(ref target);
            return -1;
        }
        if(get_artist_id_statement.step() == Sqlite.ROW)
            artist_id = get_artist_id_statement.column_int(0);

        if(artist_id == -1) { // artist not in table, yet
            // Insert artist
            insert_artist_statement.reset();
            if(insert_artist_statement.bind_text(1, artist.strip()) != Sqlite.OK) {
                this.db_error(ref target);
                return -1;
            }
            if(insert_artist_statement.step() != Sqlite.DONE) {
                this.db_error(ref target);
                return -1;
            }
            // Get unique artist id key
            get_artist_id_statement.reset();
            if(get_artist_id_statement.bind_text(1, artist != null ? artist.down().strip() : EMPTYSTRING) != Sqlite.OK) {
                this.db_error(ref target);
                return -1;
            }
            if(get_artist_id_statement.step() == Sqlite.ROW)
                artist_id = get_artist_id_statement.column_int(0);
        }
        if(update_artist) {
            Statement stmt;
            this.target.prepare_v2(STMT_UPDATE_ARTIST_NAME, -1, out stmt);
            stmt.reset();
            if(stmt.bind_text(1, artist)    != Sqlite.OK ||
               stmt.bind_int (2, artist_id) != Sqlite.OK ) {
                this.db_error(ref target);
                return -1;
            }
            if(stmt.step() != Sqlite.DONE) {
                this.db_error(ref target);
                return -1;
            }
        }
        return artist_id;
    }




    private static const string STMT_GET_ALBUM_ID =
        "SELECT id FROM albums WHERE artist = ? AND utf8_lower(name) = ?";
    private static const string STMT_UPDATE_ALBUM_NAME = 
        "UPDATE albums SET name=? WHERE id=?";
    private int handle_album(ref int artist_id, ref string album, bool update_album = false) {
        int album_id = -1;
        
        get_album_id_statement.reset();
        if(get_album_id_statement.bind_int (1, artist_id) != Sqlite.OK ||
           get_album_id_statement.bind_text(2, album != null ? album.down().strip() : EMPTYSTRING) != Sqlite.OK ) {
            this.db_error(ref target);
            return -1;
           }
        if(get_album_id_statement.step() == Sqlite.ROW)
            album_id = get_album_id_statement.column_int(0);
        
        if(album_id == -1) { // album not in table, yet
            // Insert album
            insert_album_statement.reset();
            if(insert_album_statement.bind_int (1, artist_id)     != Sqlite.OK ||
               insert_album_statement.bind_text(2, album.strip()) != Sqlite.OK ) {
                this.db_error(ref target);
                return -1;
            }
            if(insert_album_statement.step() != Sqlite.DONE) {
                this.db_error(ref target);
                return -1;
            }
            // Get unique album id key
            get_album_id_statement.reset();
            if(get_album_id_statement.bind_int (1, artist_id           ) != Sqlite.OK ||
               get_album_id_statement.bind_text(2, album.down().strip()) != Sqlite.OK ) {
                this.db_error(ref target);
                return -1;
            }
            if(get_album_id_statement.step() == Sqlite.ROW)
                album_id = get_album_id_statement.column_int(0);
        }
        if(update_album) {
            Statement stmt;
            this.target.prepare_v2(STMT_UPDATE_ALBUM_NAME, -1, out stmt);
            stmt.reset();
            if(stmt.bind_text(1, album)    != Sqlite.OK ||
               stmt.bind_int (2, album_id) != Sqlite.OK ) {
                this.db_error(ref target);
                return -1;
            }
            if(stmt.step() != Sqlite.DONE) {
                this.db_error(ref target);
                return -1;
            }

        }
        return album_id;
    }

    private int handle_uri(string uri) {
        int uri_id = -1;

        get_uri_id_statement.reset();
        if(get_uri_id_statement.bind_text(1, uri) != Sqlite.OK) {
            this.db_error(ref target);
            return -1;
        }
        if(get_uri_id_statement.step() == Sqlite.ROW)
            uri_id = get_uri_id_statement.column_int(0);

        if(uri_id == -1) { // uri not in table, yet
            // Insert uri
            insert_uri_statement.reset();
            if(insert_uri_statement.bind_text(1, uri) != Sqlite.OK) {
                this.db_error(ref target);
                return -1;
            }
            if(insert_uri_statement.step() != Sqlite.DONE) {
                this.db_error(ref target);
                return -1;
            }
            // Get unique uri id key
            get_uri_id_statement.reset();
            if(get_uri_id_statement.bind_text(1, uri) != Sqlite.OK) {
                this.db_error(ref target);
                return -1;
            }
            if(get_uri_id_statement.step() == Sqlite.ROW)
                uri_id = get_uri_id_statement.column_int(0);
        }
        return uri_id;
    }




    private int handle_genre(ref string genre) {
        int genre_id = -1;
        if((genre.strip() == EMPTYSTRING)||(genre == null)) return -2; //NO GENRE

        get_genre_id_statement.reset();
        if(get_genre_id_statement.bind_text(1, genre != null ? genre.down().strip() : EMPTYSTRING) != Sqlite.OK) {
            this.db_error(ref target);
            return -1;
        }
        if(get_genre_id_statement.step() == Sqlite.ROW)
            genre_id = get_genre_id_statement.column_int(0);

        if(genre_id == -1) { // genre not in table, yet
            // Insert genre
            insert_genre_statement.reset();
            if(insert_genre_statement.bind_text(1, genre.strip()) != Sqlite.OK) {
                this.db_error(ref target);
                return -1;
            }
            if(insert_genre_statement.step() != Sqlite.DONE) {
                this.db_error(ref target);
                return -1;
            }
            // Get unique genre id key
            get_genre_id_statement.reset();
            if(get_genre_id_statement.bind_text(1, genre != null ? genre.down().strip() : EMPTYSTRING) != Sqlite.OK) {
                this.db_error(ref target);
                return -1;
            }
            if(get_genre_id_statement.step() == Sqlite.ROW)
                genre_id = get_genre_id_statement.column_int(0);
        }
        return genre_id;
    }
}

