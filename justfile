spitfire_dir := "/Users/dennis/Projects/Cerbos/spitfire"

up:
    #!/usr/bin/env bash
    set -euo pipefail
    dir_name=$(basename policies*)
    v="${dir_name#policies}"
    vn=$(($v+1))
    git mv policies${v} policies${vn}
    git commit -am "rebuild" | git push
    git log -1 --pretty=format:%H | tee /dev/tty | pbcopy
    printf "%s\n" $(basename policies*)

proc-commit COMMIT:
    #!/usr/bin/env bash
    set -euo pipefail
    cd '{{ spitfire_dir }}'
    just proc-commit 636080766 dbuduev getting-started-crud branch main '{{ COMMIT }}'

