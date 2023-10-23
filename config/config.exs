import Config

Code.put_compiler_option(:parser_options, [columns: true, token_metadata: false])
Code.compile_file("lib/tracer_demo/tracer.ex")
Code.put_compiler_option(:tracers, [TracerDemo.Tracer])
