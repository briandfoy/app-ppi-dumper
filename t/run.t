#!/usr/bin/perl

use File::Basename qw(basename);
use File::Spec::Functions qw(catfile);

use Test::More 'no_plan';
use Test::Output;

my $class  = 'App::PPI::Dumper';
my $method = 'run';

use_ok( $class );
can_ok( $class, $method );

my @regressions = (
	[ qw(corpus/hello.pl) ],
	);	

foreach my $argv ( @regressions )
	{
	ok( -e $argv->[-1], "Input file $argv->[-1] exists" );
	
	my $basename = basename( $argv->[-1] );
	
	my $output_file = catfile( 'regression', $basename );
	ok( -e $output_file, "Regression file $output_file exists" );
	
	my $expected_output = do { local( @ARGV, $/ ) = $output_file; <> };
	
	stdout_is(
		sub { $class->run( @$argv ) },
		$expected_output
		);
	
	
	}
