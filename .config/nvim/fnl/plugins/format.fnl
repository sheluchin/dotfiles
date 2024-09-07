; (local conform (require :conform))
;
; (conform.setup
;   {:formatters_by_ft
;    {:python ["yapf"]
;     :sql ["sqlfluff"]}})
;
; (vim.api.nvim_create_user_command "Format"
;   (fn [args]
;     (var range nil)
;     (when (not= args.count -1)
;       (let [end-line (. (vim.api.nvim_buf_get_lines 0 (- args.line2 1) args.line2 true) 1)]
;         (set range {:start [args.line1 0]
;                     :end [args.line2 (string.len end-line)]})))
;     (conform.format {:async true :lsp_fallback true :range range}))
;   {:range true})
; ;
; ; (comment)
; ; (vim.api.nvim_buf_get_lines 0 1 2 true) ; ["  {autoload {nvim aniseed.nvim"]
; ;
; ; (let [x (. ["  {autoload {nvim aniseed.nvim"] 1)]
; ;   x)

{}
