# An example Swift package, packaged with Nix.

This repository is designed to be a template for Nix-packaged Swift Package Manager projects.

### Adding Apple libraries:

Find apple libraries using `nix repl`:
```
$ nix repl
nix-repl> :lf nixpkgs
Added 15 variables

nix-repl> legacyPackages.aarch64-darwin.darwin.apple_sdk.frameworks.<TAB>
<a long list of frameworks>
```
and then add them to `buildInputs`:
```nix
buildInputs = [
    darwin.apple_sdk.frameworks.Cocoa
    darwin.apple_sdk.frameworks.SwiftUI
];
```

### Adding SPM packages:

Edit `Package.swift` as normal, run `swift package resolve`, and then run `swiftpm2nix` from nixpkgs.
