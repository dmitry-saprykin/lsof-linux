HELPERS = \
	mq-open \
	target-open-with-flags \
	\
	$(NULL)

CFLAGS  = -g -Wall -std=c99

all: $(HELPERS)

# See
# https://stackoverflow.com/questions/19964206/weird-posix-message-queue-linking-issue-sometimes-it-doesnt-link-correctly
#
# We cannot use LDFLAGS here.
# -lrt must be at the end of the command line.
#
mq-open: mq-open.o
	$(CC) $(CFLAGS) -o $@ $< -lrt
