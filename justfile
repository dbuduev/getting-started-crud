
up:
    #!/usr/bin/env bash
    set -euo pipefail
    dir_name=$(basename policies*)
    v="${dir_name#policies}"
    vn=$(($v+1))
    git mv policies${v} policies${vn}
    git commit -am "rebuild" | git push
    git log -1 --pretty=format:%H | cat



