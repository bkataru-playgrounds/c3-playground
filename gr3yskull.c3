module gr3yskull;
import std::io;

// TODO:
// inline or @inline hmmm
alias API = static @inline;

// TODO: replace with std variant?
macro min(a, b)
{
	return a < b ? a : b;
}
// TODO: replace with std variant?
macro max(a, b)
{
	return a > b ? a : b;
}

struct Image
{
	uint w, h;
	char[] data;
}

struct Rect
{
	uint x, y, w, h;
}

struct Point {
	uint x, y;
}

fn void main()
{
	
}


// module greyskull;
// import std::io;

// $i

// $if not $defined(API):
// 	alias API = static inline
// $endif

// fn void main()
// {
	
// }
