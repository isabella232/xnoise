/* libplaylist-1.0.vapi generated by valac, do not modify. */

[CCode (cprefix = "Pl", lower_case_cprefix = "pl_")]
namespace Pl {
	[CCode (cprefix = "PlAsx", lower_case_cprefix = "pl_asx_")]
	namespace Asx {
	}
	[CCode (cprefix = "PlM3u", lower_case_cprefix = "pl_m3u_")]
	namespace M3u {
	}
	[CCode (cprefix = "PlPls", lower_case_cprefix = "pl_pls_")]
	namespace Pls {
	}
	[CCode (cprefix = "PlXspf", lower_case_cprefix = "pl_xspf_")]
	namespace Xspf {
	}
	[CCode (ref_function = "pl_data_ref", unref_function = "pl_data_unref", cheader_filename = "libplaylist.h")]
	public class Data {
		[CCode (cprefix = "PL_DATA_FIELD_", cheader_filename = "libplaylist.h")]
		public enum Field {
			URI,
			TITLE,
			AUTHOR,
			GENRE,
			ALBUM,
			COPYRIGHT,
			DURATION
		}
		public Data ();
		public void add_field (Pl.Data.Field field, string val);
		public string? get_album ();
		public string? get_author ();
		public Pl.Data.Field[] get_contained_fields ();
		public string? get_copyright ();
		public long get_duration ();
		public string? get_duration_string ();
		public string get_field (Pl.Data.Field field);
		public string? get_genre ();
		public string? get_title ();
		public string? get_uri ();
	}
	[CCode (cheader_filename = "libplaylist.h")]
	public class Reader : GLib.Object {
		public Reader ();
		public bool data_available ();
		public string? get_album_for_uri (ref string uri_needle);
		public string? get_author_for_uri (ref string uri_needle);
		public string? get_copyright_for_uri (ref string uri_needle);
		public long get_duration_for_uri (ref string uri_needle);
		public string? get_duration_string_for_uri (ref string uri_needle);
		public string[] get_found_uris ();
		public string? get_genre_for_uri (ref string uri_needle);
		public string? get_tile_for_uri (ref string uri_needle);
		public Pl.Result read (string list_uri) throws Pl.ReaderError;
		public async Pl.Result read_async (string list_uri) throws Pl.ReaderError;
		public string playlist_uri { get; }
		public Pl.ListType ptype { get; }
	}
	[CCode (cheader_filename = "libplaylist.h")]
	public class Writer : GLib.Object {
		public Writer (Pl.ListType ptype);
		public Pl.Result write (Pl.Data[] data, string playlist_uri, bool overwrite = true) throws Pl.WriterError;
		public async Pl.Result write_asyn (Pl.Data[] data, string playlist_uri, bool overwrite = true) throws Pl.WriterError;
		public string? uri { get; }
	}
	[CCode (cprefix = "PL_LIST_TYPE_", cheader_filename = "libplaylist.h")]
	public enum ListType {
		UNKNOWN,
		IGNORED,
		M3U,
		PLS,
		ASX,
		XSPF
	}
	[CCode (cprefix = "PL_RESULT_", cheader_filename = "libplaylist.h")]
	public enum Result {
		UNHANDLED,
		ERROR,
		IGNORED,
		SUCCESS,
		EMPTY
	}
	[CCode (cprefix = "PL_READER_ERROR_", cheader_filename = "libplaylist.h")]
	public errordomain ReaderError {
		UNKNOWN_TYPE,
		SOMETHING_ELSE,
	}
	[CCode (cprefix = "PL_WRITER_ERROR_", cheader_filename = "libplaylist.h")]
	public errordomain WriterError {
		UNKNOWN_TYPE,
		SOMETHING_ELSE,
	}
	[CCode (cheader_filename = "libplaylist.h")]
	public static bool debug;
	[CCode (cheader_filename = "libplaylist.h")]
	public static long get_duration_from_string (ref string? duration_string);
}
