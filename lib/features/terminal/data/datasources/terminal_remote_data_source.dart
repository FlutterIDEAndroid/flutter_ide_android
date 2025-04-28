import 'dart:convert';

import 'package:flutter_ide_android/core/util/terminal.dart';
import 'package:flutter_pty/flutter_pty.dart';
import 'package:xterm/xterm.dart';

abstract class TerminalRemoteDataSource {
  Terminal get terminal;
  TerminalController get controller;
  Future<void> startTerminal(String workDir);
  Future<void> writeToTerminal(String data);
  Future<void> resize(int width, int height);
}

class TerminalRemoteDataSourceImpl implements TerminalRemoteDataSource {
  final bool useSystemShell;
  Pty? _pty;

  @override
  final Terminal terminal;
  @override
  final TerminalController controller;

  TerminalRemoteDataSourceImpl({bool? useSystemShell})
      : useSystemShell = useSystemShell ?? false,
        terminal = Terminal(maxLines: 10000),
        controller = TerminalController();

  @override
  Future<void> startTerminal(String workDir) async {
    final term = TerminalUtil();
    final executable =
        useSystemShell ? 'bash' : '/data/data/com.termux/files/usr/lib/bash';
    _pty = Pty.start(
      'bash',
      environment: {
        'HOME': await term.getHomePath(),
        'TERMUX_PREFIX': await term.getUsrPath(),
        'TERM': 'xterm-256color',
        //'PATH': await term.getBinPath(),
        // 'LD_PRELOAD': '${await term.getLibPath()}/libtermux-exec.so',
      },
      workingDirectory: workDir,
      columns: terminal.viewWidth,
      rows: terminal.viewHeight,
    );
    _pty?.output
        .cast<List<int>>()
        .transform(const Utf8Decoder())
        .listen((data) {
      terminal.write(data);
    });
    _pty?.exitCode.then((code) {
      terminal.write('\nProcess exited with code $code\n');
    });
    terminal.onOutput = (data) {
      _pty?.write(const Utf8Encoder().convert(data));
    };

    terminal.onResize = (width, height, pixelWidth, pixelHeight) {
      _pty?.resize(height, width);
    };
  }

  @override
  Future<void> writeToTerminal(String data) async {
    _pty?.write(const Utf8Encoder().convert(data));
  }

  @override
  Future<void> resize(int width, int height) async {
    _pty?.resize(height, width);
  }
}
