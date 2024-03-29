# Build with Liberty

all:
	se compile gol.ace

# Build with ISE

with_ise:
	ec -batch -config gol.ecf
	cd EIFGENs/gol/W_code && finish_freezing

# Build with Gobo

with_gobo:
	gec gol_gobo.ecf
	./gol_gobo.sh

clean:
	rm *.c *.h *.o *.make *.sh

# Tests

test: test_clean
	se test .

test_fast: test_clean
	se test -boost .

test_clean:
	rm -f */eiffeltest/LOCK
