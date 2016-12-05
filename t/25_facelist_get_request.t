use strict;
use warnings;
use Test::More;
use Net::Azure::CognitiveServices::Face;

Net::Azure::CognitiveServices::Face->access_key('MYSECRET');
my $facelist = Net::Azure::CognitiveServices::Face->FaceList;
isa_ok $facelist, 'Net::Azure::CognitiveServices::Face::FaceList';
can_ok $facelist, qw/_get_request/;

my $req = $facelist->_get_request('my_facelist');
isa_ok $req, 'HTTP::Request';
is $req->uri, 'https://api.projectoxford.ai/face/v1.0/facelists/my_facelist';
is $req->method, 'GET';
is $req->header('Content-Type'), 'application/json';
is $req->header('Ocp-Apim-Subscription-Key'), 'MYSECRET';

done_testing;