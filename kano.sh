#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�	Ȉbkano.sh �SMS�0��W��MJ.����F8�8B��H��$[���U�s��{o��4��+1�VL��3�L�x���D��
�j�ӎ�LL�O#1qr+t ��0���Hpiʤ�m�U|w���9�\P��U`��e��q����TS�E�0��)�^H�L�3L���,�2�ّcJ����G�p\�*Ů���Ѳ�aEӨ˫�_��'��FK鬶iT��vU���� xۗJM���^���Pa����QC��(��Z[{V����ks�O��p;�ٞ������[����,Z��m��!2]ܓZ�[�_�GgB=��iZ���O?mGX�?N��8f �,j��-��_�Ïcg:��8qߣi+��  