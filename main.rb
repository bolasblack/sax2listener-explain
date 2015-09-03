require 'rexml/parsers/sax2parser'

xml = <<EOF
<!DOCTYPE documentation SYSTEM "http://www.germane-software.com/repositories/public/documentation/documentation.dtd">
<?xml version="1.0" encoding="UTF-8"?>
<ProductionSupport version="1.1" >
  <Errors>
    <CommonErrors>
      <CommonError>
        <Key><![CDATA[RoyUpdatePolicyBusReq(Object)>>#error:]]></Key>
        <Patterns>
          <Pattern><![CDATA[The error code is '9997']]></Pattern>
        </Patterns>
        <Message>
          <String>Update Policy request 9997: Please check CICS log</String>
        </Message>
        <BackendSupport/>
      </CommonError>
      <CommonError>
        <Key>MotorInsuranceContract(Object)>>#error:</Key>
        <Patterns>
          <Pattern>Have not got a complete</Pattern>
        </Patterns>
        <Message>
          <String>Have not got a complete and consistent set of price matrices for policy period - ask back-end prod supp to sort out</String>
        </Message>
        <BackendSupport/>
      </CommonError>
    </CommonErrors>
  </Errors>
</ProductionSupport>
EOF

parser = REXML::Parsers::SAX2Parser.new xml

parser.listen(:attlistdecl) { |element, pairs, contents|
  puts "listen :attlistdecl element: \"#{text}\" pairs: \"#{pairs}\" contents: \"#{contents}\""
}
# parser.listen(:cdata) { |contents|
#   puts "listen :cdata contents: \"#{contents}\""
# }
# parser.listen(:characters) { |text|
#   puts "listen :characters text: \"#{text}\""
# }
# parser.listen(:comment) { |comment|
#   puts "listen :comment comment: \"#{comment}\""
# }
parser.listen(:doctype) { |name, pub_sys, long_name, uri|
  puts "listen :doctype name: \"#{name}\" pub_sys: \"#{pub_sys}\" long_name: \"#{long_name}\" uri: \"#{uri}\""
}
# parser.listen(:elementdecl) { |content|
#   puts "listen :elementdecl content: \"#{content}\""
# }
# parser.listen(:end_document) {
#   puts "listen :end_document"
# }
parser.listen(:end_element) { |uri, localname, qname|
  puts "listen :end_element uri: \"#{uri}\" localname: \"#{localname}\" qname: \"#{qname}\""
}
parser.listen(:end_prefix_mapping) { |prefix|
  puts "listen :end_prefix_mapping prefix: \"#{prefix}\""
}
parser.listen(:entitydecl) { |name, decl|
  puts "listen :entitydecl name: \"#{name}\" decl: \"#{decl}\""
}
# parser.listen(:notationdecl) { |content|
#   puts "listen :notationdecl content: \"#{content}\""
# }
parser.listen(:processing_instruction) { |target, data|
  puts "listen :processing_instruction target: \"#{target}\" data: \"#{data}\""
}
# parser.listen(:progress) { |position|
#   puts "listen :progress position: \"#{position}\""
# }
# parser.listen(:start_document) {
#   puts "listen :start_document"
# }
parser.listen(:start_element) { |uri, localname, qname, attributes|
  puts "listen :start_element uri: \"#{uri}\" localname: \"#{localname}\" qname: \"#{qname}\" attributes: \"#{attributes}\""
}
parser.listen(:start_prefix_mapping) { |prefix, uri|
  puts "listen :start_prefix_mapping prefix: \"#{prefix}\" uri: \"#{uri}\""
}
parser.listen(:xmldecl) { |version, encoding, standalone|
  puts "listen :xmldecl version: \"#{version}\" encoding: \"#{encoding}\" standalone: \"#{standalone}\""
}

parser.parse
