(local name :ruff)

(local root-markers
  ["pyproject.toml"
   "ruff.toml"
   ".ruff.toml"
   "setup.py"
   "setup.cfg"
   "requirements.txt"
   "Pipfile"
   "pyrightconfig.json"
   ".git"])

(local config
  {:cmd ["ruff" "server"]
   :filetypes [:python]
   :root_markers root-markers})

{: name
 : config}
