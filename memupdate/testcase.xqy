xquery version "1.0-ml";
import module namespace mem = "http://xqdev.com/in-mem-update" 
  at 'in-mem-update.xqy';
(:  at '/MarkLogic/appservices/utils/in-mem-update.xqy'; :)

let $doc := document {
  <root>
    <sub-root>
      <foo>
        <bar>bar</bar>
        <bar>another bar</bar>
      </foo>
      { for $x in 1 to 1000 return <x>x{ for $y in 1 to 10 return <y>y</y> }</x> }
     </sub-root>
  </root>
}

let $result := mem:node-delete($doc//bar)
return xdmp:elapsed-time()

(:
timings on my laptop:
new: 0.25s
old: 13.8s
:)
