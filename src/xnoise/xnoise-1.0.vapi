/* xnoise-1.0.vapi generated by valac, do not modify. */

[CCode (cprefix = "Xnoise", lower_case_cprefix = "xnoise_")]
namespace Xnoise {
	[CCode (cheader_filename = "xnoise.h")]
	public class AboutDialog : Gtk.AboutDialog {
		public AboutDialog ();
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class AlbumImage : Gtk.Fixed {
		public Gtk.Image albumimage;
		public Gtk.Image albumimage_overlay;
		public void find_album_image (string uri);
		public void find_google_image (string search_term);
		public AlbumImage ();
		public void* set_albumimage_from_goo ();
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class AppStarter : GLib.Object {
		public static Xnoise.Main xn;
		public static int main (string[] args);
		public AppStarter ();
		public static Unique.Response on_message_received (Unique.App sender, int command, Unique.MessageData message_data, uint time);
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class DbBrowser : GLib.Object {
		public string[] get_albums (string artist, ref string searchtext);
		public string[] get_artists (ref string searchtext);
		public string[] get_lastused_uris ();
		public string[] get_titles (string artist, string album, ref string searchtext);
		public int get_track_id_for_path (string uri);
		public bool get_trackdata_for_uri (string uri, out Xnoise.TrackData val);
		public int get_tracknumber_for_title (string artist, string album, string title);
		public string get_uri_for_title (string artist, string album, string title);
		public DbBrowser ();
		public bool uri_is_in_db (string uri);
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class DbWriter : GLib.Object {
		public void begin_transaction ();
		public void commit_transaction ();
		public string[] get_music_folders ();
		public DbWriter ();
		public void write_final_tracks_to_db (string[] final_tracklist);
		public void write_music_folder_into_db (string[] mfolders);
		public signal void sign_import_progress (uint current, uint amount);
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class Main : GLib.Object {
		public Xnoise.MainWindow main_window;
		public Xnoise.Plugin plugin;
		public Xnoise.PluginLoader plugin_loader;
		public void add_track_to_gst_player (string uri);
		public static Xnoise.Main instance ();
		public Main ();
		public void printa ();
		public void quit ();
		public void save_tracklist ();
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class MainWindow : Gtk.Builder, Xnoise.IParameter {
		public Xnoise.AlbumImage albumimage;
		public double current_volume;
		public Xnoise.MusicBrowser musicBr;
		public Gtk.Notebook notebook;
		public Gtk.Button playPauseButton;
		public Gtk.Image playpause_popup_image;
		public Gtk.Button repeatButton;
		public Gtk.Image repeatImage;
		public Gtk.Label repeatLabel;
		public Gtk.Entry searchEntryMB;
		public Gtk.ProgressBar songProgressBar;
		public Xnoise.TrackList trackList;
		public Gtk.Window window;
		public void change_song (int direction, bool handle_repeat_state = false);
		public MainWindow ();
		public void playpause_button_set_pause_picture ();
		public void playpause_button_set_play_picture ();
		public void progressbar_set_value (uint pos, uint len);
		public void set_displayed_title (string newuri);
		public int repeatState { get; set; }
		public signal void sign_pos_changed (double fraction);
		public signal void sign_volume_changed (double fraction);
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class MusicBrowser : Gtk.TreeView, Xnoise.IParameter {
		public Gtk.TreeStore model;
		public bool change_model_data ();
		public MusicBrowser ();
		public bool on_button_press (Xnoise.MusicBrowser sender, Gdk.EventButton e);
		public bool on_button_release (Xnoise.MusicBrowser sender, Gdk.EventButton e);
		public void on_drag_data_get (Xnoise.MusicBrowser sender, Gdk.DragContext context, Gtk.SelectionData selection, uint info, uint etime);
		public void on_drag_end (Xnoise.MusicBrowser sender, Gdk.DragContext context);
		public void on_searchtext_changed (Gtk.Entry sender);
		public signal void sign_activated ();
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class Params : GLib.Object, Xnoise.IParameter {
		public void data_register (Xnoise.IParameter iparam);
		public static Xnoise.Params instance ();
		public Params ();
		public void read_from_file ();
		public void read_from_file_for_single (Xnoise.IParameter iparam);
		public void write_to_file ();
		public void write_to_file_for_single (Xnoise.IParameter iparam);
		public int posX { get; set; }
		public int posY { get; set; }
		public int winHeight { get; set; }
		public bool winMaxed { get; set; }
		public int winWidth { get; set; }
	}
	[CCode (cheader_filename = "xnoise.h")]
	public abstract class Plugin : GLib.Object {
		public string name;
		public string title;
		public Plugin (string name, string? title);
		public bool available { get; set; }
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class PluginLoader : GLib.Object {
		public GLib.HashTable<string,Xnoise.IPlugin> plugin_hash;
		public void add_plugin ();
		public bool load ();
		public PluginLoader ();
		public signal void plugin_available (Xnoise.IPlugin plugin);
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class SettingsDialog : Gtk.Builder, Xnoise.IParameter {
		public Gtk.Dialog dialog;
		public SettingsDialog ();
		public signal void sign_finish ();
	}
	[CCode (cheader_filename = "xnoise.h")]
	public class TrackList : Gtk.TreeView, Xnoise.IParameter {
		public Gtk.ListStore listmodel;
		public void add_uris (string[]? uris);
		public bool get_active_path (out Gtk.TreePath path);
		public string[] get_all_tracks ();
		public string get_uri_for_path (Gtk.TreePath path);
		public Gtk.TreeIter insert_title (int status = 0, Gdk.Pixbuf? pixbuf, int tracknumber, string title, string album, string artist, string uri);
		public TrackList ();
		public bool not_empty ();
		public void on_activated (string uri, Gtk.TreePath path);
		public bool on_button_press (Xnoise.TrackList sender, Gdk.EventButton e);
		public bool on_button_release (Xnoise.TrackList sender, Gdk.EventButton e);
		public void on_drag_data_get (Xnoise.TrackList sender, Gdk.DragContext context, Gtk.SelectionData selection, uint target_type, uint etime);
		public void on_drag_end (Xnoise.TrackList sender, Gdk.DragContext context);
		public bool on_drag_motion (Xnoise.TrackList sender, Gdk.DragContext context, int x, int y, uint timestamp);
		public void remove_selected_row ();
		public void reset_play_status_for_title ();
		public void set_focus_on_iter (ref Gtk.TreeIter iter);
		public void set_pause_picture ();
		public void set_play_picture ();
		public void set_state_picture_for_title (Gtk.TreeIter iter, int state = Xnoise.TrackStatus.STOPPED);
		public signal void sign_active_path_changed ();
	}
	[CCode (cheader_filename = "xnoise.h")]
	public interface IParameter : GLib.Object {
		public abstract void read_data (GLib.KeyFile file) throws GLib.KeyFileError;
		public abstract void write_data (GLib.KeyFile file);
	}
	[CCode (cheader_filename = "xnoise.h")]
	public interface IPlugin : GLib.Object {
		public abstract void activate (ref unowned Xnoise.Main xn);
		public abstract string pname { get; set construct; }
	}
	[CCode (type_id = "XNOISE_TYPE_TRACK_DATA", cheader_filename = "xnoise.h")]
	public struct TrackData {
		public string Artist;
		public string Album;
		public string Title;
		public string Genre;
		public uint Tracknumber;
	}
	[CCode (cprefix = "XNOISE_DIRECTION_", cheader_filename = "xnoise.h")]
	public enum Direction {
		NEXT,
		PREVIOUS
	}
	[CCode (cprefix = "XNOISE_MUSIC_BROWSER_COLUMN_", cheader_filename = "xnoise.h")]
	public enum MusicBrowserColumn {
		ICON,
		VIS_TEXT,
		ARTIST_ID,
		ALBUM_ID,
		TITLE_ID
	}
	[CCode (cprefix = "XNOISE_REPEAT_", cheader_filename = "xnoise.h")]
	public enum Repeat {
		NOT_AT_ALL,
		SINGLE,
		ALL
	}
	[CCode (cprefix = "XNOISE_TRACK_LIST_COLUMN_", cheader_filename = "xnoise.h")]
	public enum TrackListColumn {
		STATE,
		ICON,
		TRACKNUMBER,
		TITLE,
		ALBUM,
		ARTIST,
		URI
	}
	[CCode (cprefix = "XNOISE_TRACK_STATUS_", cheader_filename = "xnoise.h")]
	public enum TrackStatus {
		STOPPED,
		PLAYING,
		PAUSED,
		POSITION_FLAG
	}
}
