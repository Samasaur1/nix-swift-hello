import ArgumentParser

@main
struct Hello: ParsableCommand {
    let text = "Hello, world!"

    func run() throws {
        print(self.text)
    }
}
