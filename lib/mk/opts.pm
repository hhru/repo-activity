#!/usr/bin/perl
# Экспортируем опции запуска или переменные окружения в константы
package mk::opts;
use strict;
use warnings;
use Getopt::Long;
use Data::Dumper;

sub import {
	my ($self, $msg) = @_;
	my %in=%{$msg};
	if(grep {$_ eq "--help"} @ARGV and not exists $in{help}){
		map { printf "--%-20s %s\n", $_, $in{$_}->{desc}//"" } sort keys %in;
		exit 1;
	}
	
	map { my$k=$_;$_=uc;$in{$k}->{value}=ref $in{$k}->{value} eq 'ARRAY'?[$ENV{$_}]:$ENV{$_} if defined $ENV{$_} } keys %in;
	my %const=map {($_,ref $in{$_}->{value}?[]:\$in{$_}->{value})} keys %in;
	{
		GetOptions (map {($in{$_}->{getopt}//$_,$const{$_})} keys %const) or die("Error in command line arguments\n");
		map {
			$const{$_}=$in{$_}->{value} unless ref $const{$_} eq 'ARRAY' && @{$const{$_}};
		} keys %const;

		my @new_keys = keys %const;
		map {$_=uc} @new_keys;
		@const{@new_keys} = delete @const{keys %const};
	}
	eval "use constant {%const}";
}
1;
