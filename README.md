# An example Swift package, packaged with Nix.

This repository is designed to be a template for Nix-packaged Swift Package Manager projects.

### Adding Apple libraries:

You don't need to do anything to add libraries in the SDK. Just import them in Swift.

That said, if you *do* import Apple libraries, you'll want to update `default.nix` to note that the supported platforms are only Darwin.

You may also need to add a newer version of the SDK to `buildInputs`, since nixpkgs defaults to an older version of the SDK

### Adding SPM packages:

Edit `Package.swift` as normal, run `swift package resolve`, and then run `swiftpm2nix` from nixpkgs.
