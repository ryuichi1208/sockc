use 5.016;
use warnings FATAL => 'all';
use utf8;
use AnyEvent;

my $pid = shift or die "Usage: $0 pid\n";

my $cv = AE::cv;

my $t; $t = AE::timer 0, 0.1, sub {
    warn `ps -o rss= -p $pid`;
};

$cv->recv;
