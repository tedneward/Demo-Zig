const std = @import("std");
const testing = std.testing;

// {{## BEGIN comptime-generics ##}}
fn max(comptime T: type, a: T, b: T) T {
    if (T == bool) {
        return a or b; // truth is greater than falsehood
    } else if (a > b) {
        return a;
    } else {
        return b;
    }
}
fn gimmeTheBiggerFloat(a: f32, b: f32) f32 {
    return max(f32, a, b);
}
fn gimmeTheBiggerInteger(a: u64, b: u64) u64 {
    return max(u64, a, b);
}

test "basic max functionality" {
    try testing.expect(gimmeTheBiggerInteger(12, 10) == 12);
    try testing.expect(gimmeTheBiggerFloat(5.0, 4.9) == 5.0);
}
// {{## END comptime-generics ##}}
