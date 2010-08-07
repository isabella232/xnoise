/* libplaylist.h generated by valac, the Vala compiler, do not modify */


#ifndef __LIBPLAYLIST_H__
#define __LIBPLAYLIST_H__

#include <glib.h>
#include <stdlib.h>
#include <string.h>
#include <glib-object.h>
#include <gio/gio.h>

G_BEGIN_DECLS


#define PL_TYPE_LIST_TYPE (pl_list_type_get_type ())

#define PL_TYPE_RESULT (pl_result_get_type ())

#define PL_TYPE_TARGET_TYPE (pl_target_type_get_type ())

#define PL_TYPE_ITEM (pl_item_get_type ())
#define PL_ITEM(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), PL_TYPE_ITEM, PlItem))
#define PL_ITEM_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), PL_TYPE_ITEM, PlItemClass))
#define PL_IS_ITEM(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), PL_TYPE_ITEM))
#define PL_IS_ITEM_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), PL_TYPE_ITEM))
#define PL_ITEM_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), PL_TYPE_ITEM, PlItemClass))

typedef struct _PlItem PlItem;
typedef struct _PlItemClass PlItemClass;
typedef struct _PlItemPrivate PlItemPrivate;

#define PL_ITEM_TYPE_FIELD (pl_item_field_get_type ())

#define PL_TYPE_ITEM_COLLECTION (pl_item_collection_get_type ())
#define PL_ITEM_COLLECTION(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), PL_TYPE_ITEM_COLLECTION, PlItemCollection))
#define PL_ITEM_COLLECTION_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), PL_TYPE_ITEM_COLLECTION, PlItemCollectionClass))
#define PL_IS_ITEM_COLLECTION(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), PL_TYPE_ITEM_COLLECTION))
#define PL_IS_ITEM_COLLECTION_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), PL_TYPE_ITEM_COLLECTION))
#define PL_ITEM_COLLECTION_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), PL_TYPE_ITEM_COLLECTION, PlItemCollectionClass))

typedef struct _PlItemCollection PlItemCollection;
typedef struct _PlItemCollectionClass PlItemCollectionClass;
typedef struct _PlItemCollectionPrivate PlItemCollectionPrivate;

#define PL_ITEM_COLLECTION_TYPE_ITERATOR (pl_item_collection_iterator_get_type ())
#define PL_ITEM_COLLECTION_ITERATOR(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), PL_ITEM_COLLECTION_TYPE_ITERATOR, PlItemCollectionIterator))
#define PL_ITEM_COLLECTION_ITERATOR_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), PL_ITEM_COLLECTION_TYPE_ITERATOR, PlItemCollectionIteratorClass))
#define PL_ITEM_COLLECTION_IS_ITERATOR(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), PL_ITEM_COLLECTION_TYPE_ITERATOR))
#define PL_ITEM_COLLECTION_IS_ITERATOR_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), PL_ITEM_COLLECTION_TYPE_ITERATOR))
#define PL_ITEM_COLLECTION_ITERATOR_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), PL_ITEM_COLLECTION_TYPE_ITERATOR, PlItemCollectionIteratorClass))

typedef struct _PlItemCollectionIterator PlItemCollectionIterator;
typedef struct _PlItemCollectionIteratorClass PlItemCollectionIteratorClass;
typedef struct _PlItemCollectionIteratorPrivate PlItemCollectionIteratorPrivate;

#define PL_TYPE_READER (pl_reader_get_type ())
#define PL_READER(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), PL_TYPE_READER, PlReader))
#define PL_READER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), PL_TYPE_READER, PlReaderClass))
#define PL_IS_READER(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), PL_TYPE_READER))
#define PL_IS_READER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), PL_TYPE_READER))
#define PL_READER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), PL_TYPE_READER, PlReaderClass))

typedef struct _PlReader PlReader;
typedef struct _PlReaderClass PlReaderClass;
typedef struct _PlReaderPrivate PlReaderPrivate;

#define PL_TYPE_WRITER (pl_writer_get_type ())
#define PL_WRITER(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), PL_TYPE_WRITER, PlWriter))
#define PL_WRITER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), PL_TYPE_WRITER, PlWriterClass))
#define PL_IS_WRITER(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), PL_TYPE_WRITER))
#define PL_IS_WRITER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), PL_TYPE_WRITER))
#define PL_WRITER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), PL_TYPE_WRITER, PlWriterClass))

typedef struct _PlWriter PlWriter;
typedef struct _PlWriterClass PlWriterClass;
typedef struct _PlWriterPrivate PlWriterPrivate;

#define SIMPLE_XML_TYPE_READER (simple_xml_reader_get_type ())
#define SIMPLE_XML_READER(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), SIMPLE_XML_TYPE_READER, SimpleXmlReader))
#define SIMPLE_XML_READER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), SIMPLE_XML_TYPE_READER, SimpleXmlReaderClass))
#define SIMPLE_XML_IS_READER(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), SIMPLE_XML_TYPE_READER))
#define SIMPLE_XML_IS_READER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), SIMPLE_XML_TYPE_READER))
#define SIMPLE_XML_READER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), SIMPLE_XML_TYPE_READER, SimpleXmlReaderClass))

typedef struct _SimpleXmlReader SimpleXmlReader;
typedef struct _SimpleXmlReaderClass SimpleXmlReaderClass;
typedef struct _SimpleXmlReaderPrivate SimpleXmlReaderPrivate;

#define SIMPLE_XML_TYPE_NODE (simple_xml_node_get_type ())
#define SIMPLE_XML_NODE(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), SIMPLE_XML_TYPE_NODE, SimpleXmlNode))
#define SIMPLE_XML_NODE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), SIMPLE_XML_TYPE_NODE, SimpleXmlNodeClass))
#define SIMPLE_XML_IS_NODE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), SIMPLE_XML_TYPE_NODE))
#define SIMPLE_XML_IS_NODE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), SIMPLE_XML_TYPE_NODE))
#define SIMPLE_XML_NODE_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), SIMPLE_XML_TYPE_NODE, SimpleXmlNodeClass))

typedef struct _SimpleXmlNode SimpleXmlNode;
typedef struct _SimpleXmlNodeClass SimpleXmlNodeClass;

#define SIMPLE_XML_TYPE_WRITER (simple_xml_writer_get_type ())
#define SIMPLE_XML_WRITER(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), SIMPLE_XML_TYPE_WRITER, SimpleXmlWriter))
#define SIMPLE_XML_WRITER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), SIMPLE_XML_TYPE_WRITER, SimpleXmlWriterClass))
#define SIMPLE_XML_IS_WRITER(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), SIMPLE_XML_TYPE_WRITER))
#define SIMPLE_XML_IS_WRITER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), SIMPLE_XML_TYPE_WRITER))
#define SIMPLE_XML_WRITER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), SIMPLE_XML_TYPE_WRITER, SimpleXmlWriterClass))

typedef struct _SimpleXmlWriter SimpleXmlWriter;
typedef struct _SimpleXmlWriterClass SimpleXmlWriterClass;
typedef struct _SimpleXmlWriterPrivate SimpleXmlWriterPrivate;
typedef struct _SimpleXmlNodePrivate SimpleXmlNodePrivate;

#define SIMPLE_XML_NODE_TYPE_ITERATOR (simple_xml_node_iterator_get_type ())
#define SIMPLE_XML_NODE_ITERATOR(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), SIMPLE_XML_NODE_TYPE_ITERATOR, SimpleXmlNodeIterator))
#define SIMPLE_XML_NODE_ITERATOR_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), SIMPLE_XML_NODE_TYPE_ITERATOR, SimpleXmlNodeIteratorClass))
#define SIMPLE_XML_NODE_IS_ITERATOR(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), SIMPLE_XML_NODE_TYPE_ITERATOR))
#define SIMPLE_XML_NODE_IS_ITERATOR_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), SIMPLE_XML_NODE_TYPE_ITERATOR))
#define SIMPLE_XML_NODE_ITERATOR_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), SIMPLE_XML_NODE_TYPE_ITERATOR, SimpleXmlNodeIteratorClass))

typedef struct _SimpleXmlNodeIterator SimpleXmlNodeIterator;
typedef struct _SimpleXmlNodeIteratorClass SimpleXmlNodeIteratorClass;
typedef struct _SimpleXmlNodeIteratorPrivate SimpleXmlNodeIteratorPrivate;

typedef enum  {
	PL_READER_ERROR_UNKNOWN_TYPE,
	PL_READER_ERROR_SOMETHING_ELSE
} PlReaderError;
#define PL_READER_ERROR pl_reader_error_quark ()
typedef enum  {
	PL_WRITER_ERROR_UNKNOWN_TYPE,
	PL_WRITER_ERROR_NO_DATA,
	PL_WRITER_ERROR_NO_DEST_URI,
	PL_WRITER_ERROR_DEST_REMOTE
} PlWriterError;
#define PL_WRITER_ERROR pl_writer_error_quark ()
typedef enum  {
	PL_LIST_TYPE_UNKNOWN = 0,
	PL_LIST_TYPE_IGNORED,
	PL_LIST_TYPE_M3U,
	PL_LIST_TYPE_PLS,
	PL_LIST_TYPE_ASX,
	PL_LIST_TYPE_XSPF,
	PL_LIST_TYPE_WPL
} PlListType;

typedef enum  {
	PL_RESULT_UNHANDLED = 0,
	PL_RESULT_ERROR,
	PL_RESULT_IGNORED,
	PL_RESULT_SUCCESS,
	PL_RESULT_EMPTY,
	PL_RESULT_DOUBLE_WRITE
} PlResult;

typedef enum  {
	PL_TARGET_TYPE_URI,
	PL_TARGET_TYPE_REL_PATH,
	PL_TARGET_TYPE_ABS_PATH
} PlTargetType;

struct _PlItem {
	GTypeInstance parent_instance;
	volatile int ref_count;
	PlItemPrivate * priv;
};

struct _PlItemClass {
	GTypeClass parent_class;
	void (*finalize) (PlItem *self);
};

typedef enum  {
	PL_ITEM_FIELD_URI = 0,
	PL_ITEM_FIELD_TITLE,
	PL_ITEM_FIELD_AUTHOR,
	PL_ITEM_FIELD_GENRE,
	PL_ITEM_FIELD_ALBUM,
	PL_ITEM_FIELD_COPYRIGHT,
	PL_ITEM_FIELD_DURATION,
	PL_ITEM_FIELD_PARAM_NAME,
	PL_ITEM_FIELD_PARAM_VALUE,
	PL_ITEM_FIELD_IS_REMOTE,
	PL_ITEM_FIELD_IS_PLAYLIST
} PlItemField;

struct _PlItemCollection {
	GTypeInstance parent_instance;
	volatile int ref_count;
	PlItemCollectionPrivate * priv;
};

struct _PlItemCollectionClass {
	GTypeClass parent_class;
	void (*finalize) (PlItemCollection *self);
};

struct _PlItemCollectionIterator {
	GTypeInstance parent_instance;
	volatile int ref_count;
	PlItemCollectionIteratorPrivate * priv;
};

struct _PlItemCollectionIteratorClass {
	GTypeClass parent_class;
	void (*finalize) (PlItemCollectionIterator *self);
};

struct _PlReader {
	GObject parent_instance;
	PlReaderPrivate * priv;
};

struct _PlReaderClass {
	GObjectClass parent_class;
};

struct _PlWriter {
	GObject parent_instance;
	PlWriterPrivate * priv;
};

struct _PlWriterClass {
	GObjectClass parent_class;
};

struct _SimpleXmlReader {
	GObject parent_instance;
	SimpleXmlReaderPrivate * priv;
	SimpleXmlNode* root;
};

struct _SimpleXmlReaderClass {
	GObjectClass parent_class;
};

struct _SimpleXmlWriter {
	GObject parent_instance;
	SimpleXmlWriterPrivate * priv;
};

struct _SimpleXmlWriterClass {
	GObjectClass parent_class;
};

struct _SimpleXmlNode {
	GTypeInstance parent_instance;
	volatile int ref_count;
	SimpleXmlNodePrivate * priv;
	GHashTable* attributes;
};

struct _SimpleXmlNodeClass {
	GTypeClass parent_class;
	void (*finalize) (SimpleXmlNode *self);
};

struct _SimpleXmlNodeIterator {
	GTypeInstance parent_instance;
	volatile int ref_count;
	SimpleXmlNodeIteratorPrivate * priv;
};

struct _SimpleXmlNodeIteratorClass {
	GTypeClass parent_class;
	void (*finalize) (SimpleXmlNodeIterator *self);
};


GQuark pl_reader_error_quark (void);
GQuark pl_writer_error_quark (void);
GType pl_list_type_get_type (void) G_GNUC_CONST;
GType pl_result_get_type (void) G_GNUC_CONST;
GType pl_target_type_get_type (void) G_GNUC_CONST;
extern gboolean pl_debug;
gpointer pl_item_ref (gpointer instance);
void pl_item_unref (gpointer instance);
GParamSpec* pl_param_spec_item (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags);
void pl_value_set_item (GValue* value, gpointer v_object);
void pl_value_take_item (GValue* value, gpointer v_object);
gpointer pl_value_get_item (const GValue* value);
GType pl_item_get_type (void) G_GNUC_CONST;
GType pl_item_field_get_type (void) G_GNUC_CONST;
PlItem* pl_item_new (void);
PlItem* pl_item_construct (GType object_type);
void pl_item_add_field (PlItem* self, PlItemField field, const char* val);
PlItemField* pl_item_get_contained_fields (PlItem* self, int* result_length1);
char* pl_item_get_field (PlItem* self, PlItemField field);
char* pl_item_get_uri (PlItem* self);
char* pl_item_get_rel_path (PlItem* self);
char* pl_item_get_abs_path (PlItem* self);
char* pl_item_get_title (PlItem* self);
char* pl_item_get_author (PlItem* self);
char* pl_item_get_genre (PlItem* self);
char* pl_item_get_album (PlItem* self);
char* pl_item_get_copyright (PlItem* self);
char* pl_item_get_duration_string (PlItem* self);
char* pl_item_get_param_name (PlItem* self);
char* pl_item_get_param_value (PlItem* self);
glong pl_item_get_duration (PlItem* self);
gboolean pl_item_is_remote (PlItem* self);
gboolean pl_item_is_playlist (PlItem* self);
PlTargetType pl_item_get_target_type (PlItem* self);
void pl_item_set_target_type (PlItem* self, PlTargetType value);
const char* pl_item_get_base_path (PlItem* self);
void pl_item_set_base_path (PlItem* self, const char* value);
gpointer pl_item_collection_ref (gpointer instance);
void pl_item_collection_unref (gpointer instance);
GParamSpec* pl_param_spec_item_collection (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags);
void pl_value_set_item_collection (GValue* value, gpointer v_object);
void pl_value_take_item_collection (GValue* value, gpointer v_object);
gpointer pl_value_get_item_collection (const GValue* value);
GType pl_item_collection_get_type (void) G_GNUC_CONST;
PlItemCollection* pl_item_collection_new (void);
PlItemCollection* pl_item_collection_construct (GType object_type);
gint pl_item_collection_get_size (PlItemCollection* self);
gboolean pl_item_collection_data_available (PlItemCollection* self);
char** pl_item_collection_get_found_uris (PlItemCollection* self, int* result_length1);
char* pl_item_collection_get_title_for_uri (PlItemCollection* self, char** uri_needle);
char* pl_item_collection_get_author_for_uri (PlItemCollection* self, char** uri_needle);
char* pl_item_collection_get_genre_for_uri (PlItemCollection* self, char** uri_needle);
char* pl_item_collection_get_album_for_uri (PlItemCollection* self, char** uri_needle);
char* pl_item_collection_get_copyright_for_uri (PlItemCollection* self, char** uri_needle);
char* pl_item_collection_get_duration_string_for_uri (PlItemCollection* self, char** uri_needle);
glong pl_item_collection_get_duration_for_uri (PlItemCollection* self, char** uri_needle);
char* pl_item_collection_get_param_name_for_uri (PlItemCollection* self, char** uri_needle);
char* pl_item_collection_get_param_value_for_uri (PlItemCollection* self, char** uri_needle);
gboolean pl_item_collection_get_is_remote_for_uri (PlItemCollection* self, char** uri_needle);
gboolean pl_item_collection_get_is_playlist_for_uri (PlItemCollection* self, char** uri_needle);
gint pl_item_collection_get_number_of_entries (PlItemCollection* self);
gboolean pl_item_collection_contains (PlItemCollection* self, PlItem* d);
gboolean pl_item_collection_contains_field (PlItemCollection* self, PlItemField field, const char* value);
PlItemField* pl_item_collection_get_contained_fields_for_idx (PlItemCollection* self, gint idx, int* result_length1);
PlItemField* pl_item_collection_get_contained_fields_for_uri (PlItemCollection* self, char** uri, int* result_length1);
gpointer pl_item_collection_iterator_ref (gpointer instance);
void pl_item_collection_iterator_unref (gpointer instance);
GParamSpec* pl_item_collection_param_spec_iterator (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags);
void pl_item_collection_value_set_iterator (GValue* value, gpointer v_object);
void pl_item_collection_value_take_iterator (GValue* value, gpointer v_object);
gpointer pl_item_collection_value_get_iterator (const GValue* value);
GType pl_item_collection_iterator_get_type (void) G_GNUC_CONST;
PlItemCollectionIterator* pl_item_collection_iterator (PlItemCollection* self);
gint pl_item_collection_index_of (PlItemCollection* self, PlItem* d);
PlItem* pl_item_collection_get (PlItemCollection* self, gint index);
void pl_item_collection_set (PlItemCollection* self, gint index, PlItem* item);
gboolean pl_item_collection_append (PlItemCollection* self, PlItem* item);
void pl_item_collection_insert (PlItemCollection* self, gint index, PlItem* item);
gboolean pl_item_collection_remove (PlItemCollection* self, PlItem* item);
PlItem* pl_item_collection_remove_at (PlItemCollection* self, gint index);
void pl_item_collection_clear (PlItemCollection* self);
void pl_item_collection_merge (PlItemCollection* self, PlItemCollection* data_collection);
PlItemCollectionIterator* pl_item_collection_iterator_new (PlItemCollection* dc);
PlItemCollectionIterator* pl_item_collection_iterator_construct (GType object_type, PlItemCollection* dc);
gboolean pl_item_collection_iterator_next (PlItemCollectionIterator* self);
gboolean pl_item_collection_iterator_first (PlItemCollectionIterator* self);
PlItem* pl_item_collection_iterator_get (PlItemCollectionIterator* self);
void pl_item_collection_iterator_remove (PlItemCollectionIterator* self);
gboolean pl_item_collection_iterator_previous (PlItemCollectionIterator* self);
gboolean pl_item_collection_iterator_has_previous (PlItemCollectionIterator* self);
void pl_item_collection_iterator_set (PlItemCollectionIterator* self, PlItem* item);
void pl_item_collection_iterator_insert (PlItemCollectionIterator* self, PlItem* item);
void pl_item_collection_iterator_append (PlItemCollectionIterator* self, PlItem* item);
gint pl_item_collection_iterator_index (PlItemCollectionIterator* self);
GType pl_reader_get_type (void) G_GNUC_CONST;
PlReader* pl_reader_new (void);
PlReader* pl_reader_construct (GType object_type);
PlResult pl_reader_read (PlReader* self, const char* list_uri, GCancellable* cancellable, GError** error);
void pl_reader_read_asyn (PlReader* self, const char* list_uri, GCancellable* cancellable, GAsyncReadyCallback _callback_, gpointer _user_data_);
PlResult pl_reader_read_asyn_finish (PlReader* self, GAsyncResult* _res_, GError** error);
gboolean pl_reader_data_available (PlReader* self);
gint pl_reader_get_number_of_entries (PlReader* self);
char** pl_reader_get_found_uris (PlReader* self, int* result_length1);
char* pl_reader_get_title_for_uri (PlReader* self, char** uri_needle);
char* pl_reader_get_author_for_uri (PlReader* self, char** uri_needle);
char* pl_reader_get_genre_for_uri (PlReader* self, char** uri_needle);
char* pl_reader_get_album_for_uri (PlReader* self, char** uri_needle);
char* pl_reader_get_copyright_for_uri (PlReader* self, char** uri_needle);
char* pl_reader_get_duration_string_for_uri (PlReader* self, char** uri_needle);
glong pl_reader_get_duration_for_uri (PlReader* self, char** uri_needle);
gboolean pl_reader_get_is_remote_for_uri (PlReader* self, char** uri_needle);
gboolean pl_reader_get_is_playlist_for_uri (PlReader* self, char** uri_needle);
PlListType pl_reader_get_ptype (PlReader* self);
const char* pl_reader_get_playlist_uri (PlReader* self);
PlItemCollection* pl_reader_get_data_collection (PlReader* self);
PlListType pl_get_playlist_type_for_uri (char** uri_);
PlListType pl_get_type_by_extension (char** uri_);
PlListType pl_get_type_by_data (char** uri_);
glong pl_get_duration_from_string (char** duration_string);
GFile* pl_get_file_for_location (const char* adr, char** base_path, PlTargetType* tt);
GType pl_writer_get_type (void) G_GNUC_CONST;
PlWriter* pl_writer_new (PlListType ptype, gboolean overwrite);
PlWriter* pl_writer_construct (GType object_type, PlListType ptype, gboolean overwrite);
PlResult pl_writer_write (PlWriter* self, PlItemCollection* data_collection, const char* playlist_uri, GCancellable* cancellable, GError** error);
void pl_writer_write_asyn (PlWriter* self, PlItemCollection* data_collection, const char* playlist_uri, GCancellable* cancellable, GAsyncReadyCallback _callback_, gpointer _user_data_);
PlResult pl_writer_write_asyn_finish (PlWriter* self, GAsyncResult* _res_, GError** error);
const char* pl_writer_get_uri (PlWriter* self);
gboolean pl_writer_get_overwrite_if_exists (PlWriter* self);
#define SIMPLE_XML_AMPERSAND_ESCAPED "&amp;"
#define SIMPLE_XML_GREATER_THAN_ESCAPED "&gt;"
#define SIMPLE_XML_LOWER_THAN_ESCAPED "&lt;"
#define SIMPLE_XML_QUOTE_ESCAPED "&quot;"
#define SIMPLE_XML_APOSTROPH_ESCAPED "&apos;"
GType simple_xml_reader_get_type (void) G_GNUC_CONST;
gpointer simple_xml_node_ref (gpointer instance);
void simple_xml_node_unref (gpointer instance);
GParamSpec* simple_xml_param_spec_node (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags);
void simple_xml_value_set_node (GValue* value, gpointer v_object);
void simple_xml_value_take_node (GValue* value, gpointer v_object);
gpointer simple_xml_value_get_node (const GValue* value);
GType simple_xml_node_get_type (void) G_GNUC_CONST;
SimpleXmlReader* simple_xml_reader_new (GFile* file);
SimpleXmlReader* simple_xml_reader_construct (GType object_type, GFile* file);
SimpleXmlReader* simple_xml_reader_new_from_string (const char* xml_string);
SimpleXmlReader* simple_xml_reader_construct_from_string (GType object_type, const char* xml_string);
void simple_xml_reader_read (SimpleXmlReader* self, gboolean case_sensitive, GCancellable* cancellable);
void simple_xml_reader_read_asyn (SimpleXmlReader* self, gboolean case_sensitive, GCancellable* cancellable, GAsyncReadyCallback _callback_, gpointer _user_data_);
void simple_xml_reader_read_asyn_finish (SimpleXmlReader* self, GAsyncResult* _res_);
GType simple_xml_writer_get_type (void) G_GNUC_CONST;
SimpleXmlWriter* simple_xml_writer_new (SimpleXmlNode* root, const char* header_string);
SimpleXmlWriter* simple_xml_writer_construct (GType object_type, SimpleXmlNode* root, const char* header_string);
void simple_xml_writer_write (SimpleXmlWriter* self, const char* filename);
SimpleXmlNode* simple_xml_node_new (const char* name);
SimpleXmlNode* simple_xml_node_construct (GType object_type, const char* name);
gboolean simple_xml_node_has_text (SimpleXmlNode* self);
gboolean simple_xml_node_has_children (SimpleXmlNode* self);
gboolean simple_xml_node_has_attributes (SimpleXmlNode* self);
void simple_xml_node_prepend_child (SimpleXmlNode* self, SimpleXmlNode* node);
void simple_xml_node_append_child (SimpleXmlNode* self, SimpleXmlNode* node);
void simple_xml_node_insert_child (SimpleXmlNode* self, gint pos, SimpleXmlNode* node);
SimpleXmlNode* simple_xml_node_get_child_by_name (SimpleXmlNode* self, const char* childname);
SimpleXmlNode** simple_xml_node_get_children_by_name (SimpleXmlNode* self, const char* childname, int* result_length1);
gint simple_xml_node_get_idx_of_child (SimpleXmlNode* self, SimpleXmlNode* node);
SimpleXmlNode* simple_xml_node_get (SimpleXmlNode* self, gint idx);
void simple_xml_node_set (SimpleXmlNode* self, gint idx, SimpleXmlNode* node);
gboolean simple_xml_node_remove_child (SimpleXmlNode* self, SimpleXmlNode* node);
gboolean simple_xml_node_remove_child_at_idx (SimpleXmlNode* self, gint idx);
void simple_xml_node_clear (SimpleXmlNode* self);
gpointer simple_xml_node_iterator_ref (gpointer instance);
void simple_xml_node_iterator_unref (gpointer instance);
GParamSpec* simple_xml_node_param_spec_iterator (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags);
void simple_xml_node_value_set_iterator (GValue* value, gpointer v_object);
void simple_xml_node_value_take_iterator (GValue* value, gpointer v_object);
gpointer simple_xml_node_value_get_iterator (const GValue* value);
GType simple_xml_node_iterator_get_type (void) G_GNUC_CONST;
SimpleXmlNodeIterator* simple_xml_node_iterator (SimpleXmlNode* self);
const char* simple_xml_node_get_text (SimpleXmlNode* self);
void simple_xml_node_set_text (SimpleXmlNode* self, const char* value);
const char* simple_xml_node_get_name (SimpleXmlNode* self);
SimpleXmlNode* simple_xml_node_get_parent (SimpleXmlNode* self);
SimpleXmlNode* simple_xml_node_get_previous (SimpleXmlNode* self);
SimpleXmlNode* simple_xml_node_get_next (SimpleXmlNode* self);
gint simple_xml_node_get_children_count (SimpleXmlNode* self);
SimpleXmlNodeIterator* simple_xml_node_iterator_new (SimpleXmlNode* parent_node);
SimpleXmlNodeIterator* simple_xml_node_iterator_construct (GType object_type, SimpleXmlNode* parent_node);
gboolean simple_xml_node_iterator_next (SimpleXmlNodeIterator* self);
SimpleXmlNode* simple_xml_node_iterator_get (SimpleXmlNodeIterator* self);
void simple_xml_node_iterator_set (SimpleXmlNodeIterator* self, SimpleXmlNode* node);

extern const char* PL_remote_schemes[2];

G_END_DECLS

#endif
