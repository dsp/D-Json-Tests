import std.json, std.datetime, std.file, std.stdio;

void parse() {
    foreach(elem; readText("test.json").parseJSON.array) {
        writeln(elem.object["title"]);
    }
}
int main(string[] args) {
    for(uint i = 0; i < 100; i++) {
        parse();
    }
    return 0;
}
