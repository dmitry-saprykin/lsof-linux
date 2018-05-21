lsof=$1
report=$2
tdir=$3
pat=$4
tfile=$5

shift 5

TARGET=$tdir/target-open-with-flags
if ! [ -x $TARGET ]; then
    echo "target execution ( $TARGET ) is not found" >> $report
    exit 1
fi

$TARGET $tfile "$@" &
pid=$!

echo "expected: $pat" >> $report
echo "lsof output:" >> $report
$lsof +fg -p $pid | tee -a $report | grep -q "$pat"
result=$?

kill $pid

exit $result
