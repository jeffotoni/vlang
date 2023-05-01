import net.http

fn main() {
	url :="http://localhost:3000/v1/avatar"
	resp := http.get(url)!
	println(resp.body)
}
