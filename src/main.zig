const std = @import("std");
const print = std.debug.print;
const io = std.io;



pub fn main() !void {
  var file = try std.fs.cwd().openFile("/etc/os-release", .{});
  defer file.close();
  var buf_reader = io.bufferedReader(file.reader());
  var in_stream = buf_reader.reader();
  var buf: [1024]u8 = undefined;
  while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
    // do something with line...
    print("{s}\n", .{ line });
  }
}
