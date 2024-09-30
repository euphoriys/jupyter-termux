yes | pkg up
pkg install git clang -y
pkg install python -y
pkg install libzmq -y
pkg install rust -y
pkg install binutils -y
pip install maturin
pkg install cmake -y
pip install pyzmq

_file="$(find $PREFIX/lib/python3.11 -name "_sysconfigdata*.py")"
rm -rf $PREFIX/lib/python3.11/__pycache__
cp "$_file" "$_file".backup
sed -i 's|-fno-openmp-implicit-rpath||g' "$_file"

pip install jupyter
pkg install -y patchelf
patchelf --add-needed libpython3.11.so /data/data/com.termux/files/usr/lib/python3.11/site-packages/zmq/backend/cython/_zmq.cpython-311.so
pkg install -y matplotlib
