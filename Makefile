# Build with Liberty

all:
	se compile gol.ace

# Build with ISE

with_ise:
	ec -batch -config gol.ecf
	cd EIFGENs/gol/W_code && finish_freezing

# Tests

test: test_clean
	se test .

test_fast: test_clean
	se test -boost .

test_clean:
	rm -f */eiffeltest/LOCK
