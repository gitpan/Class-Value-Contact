use inc::Module::Install;
name 'Class-Value-Contact';
all_from 'lib/Class/Value/Contact.pm';
perl_version '5.006';

requires 'Class::Value';
requires 'Email::Valid';
requires 'Error::Hierarchy';

build_requires 'Test::CompanionClasses';
build_requires 'Test::More' => '0.70';

use_standard_tests(without => 'pod_coverage');
auto_include;
WriteAll;
