# TracerDemo

Demonstrates that column information is not included with the line information for a function definition using the `:on_module` trace event.

## Usage

This demo has some oddities with how the tracer is included (I'm not entirely sure how to include tracers inside your own application, so you should run `mix clean` before running `mix compile`.

```sh
mix clean

mix compile
```

This should emit the following output. You will observe that the metadata element of the tuple (the third element) only has a `:line` key, but the AST of the function itself has column information.

```
[lib/tracer_demo/tracer.ex:11: TracerDemo.Tracer.trace/2]
defs #=> [
  some_macro: {:v1, :defmacrop, [line: 2],
   [
     {[line: 2], [{:list, [version: 0, line: 2, column: 24], nil}], [],
      {:{}, [],
       [
         {:{}, [],
          [
            :.,
            [column: 11],
            [
              {:{}, [], [:__aliases__, [column: 7, alias: false], [:Enum]]},
              :map
            ]
          ]},
         [column: 12],
         [
           {:list, [version: 0, line: 4, column: 24], nil},
           {:{}, [],
            [
              :fn,
              [column: 31],
              [
                {:{}, [],
                 [
                   :->,
                   [column: 38],
                   [
                     [{:{}, [], [:str, [column: 34], TracerDemo]}],
                     {:{}, [],
                      [
                        {:{}, [],
                         [
                           :.,
                           [column: 47],
                           [
                             {:{}, [], [:__aliases__, [column: 41, ...], [...]]},
                             :upcase
                           ]
                         ]},
                        [column: 48],
                        [{:{}, [], [:str, [column: 55], TracerDemo]}]
                      ]}
                   ]
                 ]}
              ]
            ]}
         ]
       ]}}
   ]},
  hello: {:v1, :def, [line: 8],
   [
     {[line: 8], [{:arg, [version: 0, line: 8, column: 13], nil}], [],
      {:__block__, [],
       [
         {:<<>>, [alignment: 0, line: 9, column: 5],
          [
            {:"::", [inferred_bitstring_spec: true, line: 9, column: 5],
             ["hello ", {:binary, [line: 9, column: 5], nil}]},
            {:"::", [line: 9, column: 12],
             [
               {{:., [line: 9], [String.Chars, :to_string]}, [line: 9],
                [{:arg, [version: 0, line: 9, column: 14], nil}]},
               {:binary, [], nil}
             ]},
            {:"::", [inferred_bitstring_spec: true, line: 9, column: 5],
             ["!", {:binary, [line: 9, column: 5], nil}]}
          ]},
         {{:., [line: 10, column: 11], [Enum, :map]}, [line: 10, column: 12],
          [
            ["hello", {:arg, [version: 0, line: 10, column: 26], nil}, "!"],
            {:fn, [line: 10, column: 31],
             [
               {:->, [line: 10, column: 38],
                [
                  [
                    {:str,
                     [
                       version: 1,
                       line: 10,
                       counter: {TracerDemo, 4},
                       column: 34
                     ], TracerDemo}
                  ],
                  {{:., [line: 10, column: 47], [String, :upcase]},
                   [line: 10, column: 48],
                   [
                     {:str,
                      [
                        version: 1,
                        line: 10,
                        counter: {TracerDemo, 4},
                        column: 55
                      ], TracerDemo}
                   ]}
                ]}
             ]}
          ]}
       ]}}
   ]}
]
```
