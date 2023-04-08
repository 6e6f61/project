{
  outputs = { self }:
  # let template = x: { ${x} = { path = ./. + ${x}; }; };
  let mkTemplates = x: with builtins;
    listToAttrs (map (p:
      { name = head p; value = { path = ./. + head p; description = elemAt p 1; }; }
    ) x);
  in
    {
      templates = mkTemplates [
        ["c"        "C89 + Make"]
        ["haskell"  "Haskell2010 + Cabal"]
        ["rust"     "Rust + Crane"]
      ];
    };
}