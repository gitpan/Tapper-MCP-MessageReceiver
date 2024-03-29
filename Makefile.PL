
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Tapper - Message receiver for Tapper MCP",
  "AUTHOR" => "AMD OSRC Tapper Team <tapper\@amd64.org>",
  "BUILD_REQUIRES" => {
    "English" => 0,
    "File::Temp" => 0,
    "IO::Socket::INET" => 0,
    "Tapper::Schema::TestTools" => 0,
    "Test::Fixture::DBIC::Schema" => 0,
    "Test::More" => 0,
    "YAML::Syck" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Tapper-MCP-MessageReceiver",
  "EXE_FILES" => [
    "bin/tapper-mcp-messagereceiver-daemon",
    "bin/tapper-mcp-messagereceiver"
  ],
  "LICENSE" => "open_source",
  "NAME" => "Tapper::MCP::MessageReceiver",
  "PREREQ_PM" => {
    "File::Spec::Functions" => 0,
    "Log::Log4perl" => 0,
    "Module::Find" => "0.11",
    "Mojolicious::Lite" => 0,
    "Tapper::Config" => 0,
    "Tapper::Model" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "4.1.3",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



