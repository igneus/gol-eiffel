all:
	se compile gol.ace

test: test_clean
	se test .

test_fast: test_clean
	se test -boost .

test_clean:
	rm -f */eiffeltest/LOCK
