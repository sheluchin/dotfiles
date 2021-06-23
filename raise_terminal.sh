gdbus call \
  --session \
  --dest org.gnome.Shell \
  --object-path /org/gnome/Shell \
  --method org.gnome.Shell.Eval "
var mw =
  global.get_window_actors()
    .map(w=>w.meta_window)
    .find(mw=>{
        if (
            mw.get_wm_class().includes('kitty') &&
            // look for the kitty window that isn't the vimwiki window
            !(mw.get_title().includes('vimwiki'))
        ) {
            return mw;
        }
        return false;
    });
mw && mw.activate(0)"
