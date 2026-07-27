#!/usr/bin/env bash
# Build every resume variant.
# fullstack.typ is the public one and overwrites the PDF served by the site.
# The rest land in build/ and are sent by hand, per application.
set -euo pipefail

cd "$(dirname "$0")/.."
mkdir -p resume/build

# No global typst version is pinned in this environment, so go through mise.
if typst --version >/dev/null 2>&1; then
  TYPST=(typst)
else
  TYPST=(mise exec typst@0.15.1 -- typst)
fi

"${TYPST[@]}" compile resume/fullstack.typ static/JiaYi_Ooi_Resume.pdf
"${TYPST[@]}" compile resume/sre.typ       resume/build/JiaYi_Ooi_Resume_Platform.pdf
"${TYPST[@]}" compile resume/fde.typ       resume/build/JiaYi_Ooi_Resume_FDE.pdf
"${TYPST[@]}" compile resume/master.typ    resume/build/master.pdf

echo "Built:"
echo "  static/JiaYi_Ooi_Resume.pdf                 (full-stack, public)"
echo "  resume/build/JiaYi_Ooi_Resume_Platform.pdf  (platform / SRE)"
echo "  resume/build/JiaYi_Ooi_Resume_FDE.pdf       (forward deployed)"
echo "  resume/build/master.pdf                     (master - never send)"

# lib.typ defines the helper and documents it, so it is never a real hit.
unfilled=$(grep -l '#todo\[' resume/*.typ | grep -v '/lib\.typ$' || true)
if [ -n "$unfilled" ]; then
  echo
  echo "WARNING: unfilled todo[] placeholders remain in:"
  echo "$unfilled" | sed 's/^/  /'
  echo "They render in orange brackets. Do not send a variant until its own are gone."
fi
