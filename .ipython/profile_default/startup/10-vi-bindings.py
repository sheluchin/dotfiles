from IPython import get_ipython
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, HasSelection, ViInsertMode, EmacsInsertMode
from prompt_toolkit.key_binding.key_processor import KeyPress
from prompt_toolkit.keys import Keys

ip = get_ipython()
insert_mode = ViInsertMode() | EmacsInsertMode()

def escape_from_insert_mode(event):
    " Map 'jj' to Escape. "
    event.cli.input_processor.feed(KeyPress(Keys.Escape))

# Register the shortcut if IPython is using prompt_toolkit
if getattr(ip, 'pt_cli'):
    registry = ip.pt_cli.application.key_bindings_registry
    registry.add_binding('j', 'j', filter=ViInsertMode())(escape_from_insert_mode)
