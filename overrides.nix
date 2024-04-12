{ ruamel-yaml, prompt-toolkit, pysdl2, setuptools-scm, evdev, xkbcommon }:
self: super: {
  plover_yaml_dictionary = super.plover_yaml_dictionary.overrideAttrs (old: {
    propagatedBuildInputs = [ ruamel-yaml ];
  });
  plover_console_ui = super.plover_console_ui.overrideAttrs (old: {
    propagatedBuildInputs = [ prompt-toolkit ];
    doCheck = false;
    doInstallCheck = false;
  });
  plover-controller = super.plover-controller.overrideAttrs (old: {
    propagatedBuildInputs = [ pysdl2 ];
  });
  plover_dict_commands = super.plover_dict_commands.overrideAttrs (old: {
    propagatedBuildInputs = [ setuptools-scm ];
  });
  plover-uinput = super.plover-uinput.overrideAttrs (old: {
    propagatedBuildInputs = [ evdev xkbcommon ];
  });
}
