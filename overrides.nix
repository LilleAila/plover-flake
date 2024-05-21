{
  ruamel-yaml,
  prompt-toolkit,
  pysdl2,
  setuptools-scm,
  evdev,
  xkbcommon,
  python3Packages,
  sources,
  plover,
}: self: super: {
  plover_yaml_dictionary = super.plover_yaml_dictionary.overrideAttrs (old: {
    propagatedBuildInputs = [ruamel-yaml];
  });
  plover_console_ui = super.plover_console_ui.overrideAttrs (old: {
    propagatedBuildInputs = [prompt-toolkit];
    doCheck = false;
    doInstallCheck = false;
  });
  plover-controller = super.plover-controller.overrideAttrs (old: {
    propagatedBuildInputs = [pysdl2];
  });
  plover_dict_commands = super.plover_dict_commands.overrideAttrs (old: {
    propagatedBuildInputs = [setuptools-scm];
  });
  plover_uinput = super.plover_uinput.overrideAttrs (old: {
    propagatedBuildInputs = [evdev xkbcommon];
  });
  plover-lapwing-aio = super.plover-lapwing-aio.overrideAttrs (old: {
    propagatedBuildInputs = let
      plugins = python3Packages.callPackage ./plugins.nix {inherit plover sources;};
    in ((ps:
      with ps; [
        plover_dict_commands
        plover_last_translation
        plover-modal-dictionary
        plover_python_dictionary
        plover_stitching
      ])
    plugins);
  });
}
