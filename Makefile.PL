use ExtUtils::MakeMaker;

require 5.008;

eval "use Test::Manifest 1.14";

WriteMakefile(
	'NAME'	       => 'App::PPI::Dumper',
	'ABSTRACT'     => 'This is what the module does',
	'VERSION_FROM' => 'lib/Dumper.pm',
	'LICENSE'      => 'perl',
	'AUTHOR'       => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'    => { 
		'Test::More' => '0',
		},

	'PM'           => {
		'lib/Dumper.pm'         => '$(INST_LIBDIR)/Dumper.pm',
		},

	'MAN3PODS'     => {
		'lib/Dumper.pm' => '$(INST_MAN3DIR)/App::PPI::Dumper.3',
		},

	clean  => { FILES    => q|App-PPI-Dumper-*| },

	);
