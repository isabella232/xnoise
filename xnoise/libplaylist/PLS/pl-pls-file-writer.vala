/* pl-pls-file-writer.vala
 *
 * Copyright(C) 2010  Jörn Magens
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or(at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jörn Magens <shuerhaaken@googlemail.com>
 */

namespace Pl {
	// base class for all playlist filewriter implementations
	private class Pls.FileWriter : AbstractFileWriter {
		
		private Data[] data_collection;
		private File file;

		public override Result write(File _file, Data[] _data_collection) throws InternalWriterError {
			this.file = _file;
			this.data_collection = _data_collection;
			if(data_collection != null && data_collection.length > 0) {
				try {
					if(file.query_exists(null)) {
						file.delete(null);
					}

					var file_stream = file.create(FileCreateFlags.NONE, null);
					var data_stream = new DataOutputStream(file_stream);
					
					data_stream.put_string("[playlist]\n\n", null);
					int i = 1;
					foreach(Data d in data_collection) {
						if(d.get_field(Data.Field.URI) == null)
							continue;
						data_stream.put_string("File" +i.to_string() + "=" + d.get_field(Data.Field.URI) + "\n", null);
						data_stream.put_string("Title" +i.to_string() + "=" + "\n", null);
						data_stream.put_string("Length" +i.to_string() + "=" + "-1\n\n", null);
						i++;
					}
					data_stream.put_string("NumberOfEntries=" + data_collection.length.to_string() + "\n", null);
					data_stream.put_string("Version=2\n", null);
				}
				catch(GLib.Error e) {
					print("%s\n", e.message);
				}
			}
			return Result.UNHANDLED;
		}
		
		public override async Result write_asyn(File _file, Data[] _data_collection) throws InternalWriterError {
			this.file = _file;
			this.data_collection = _data_collection;
			return Result.UNHANDLED;
		}
	}
}

