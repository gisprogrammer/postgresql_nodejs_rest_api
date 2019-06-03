/*
BEGIN
	  apex_json.parse (
       p_source => rest_parcel('parcel_number'));
       dbms_output.put_line('count: '||apex_json.get_count(p_path=>'rows[1]')); 
       dbms_output.put_line('sid: '||
		       apex_json.get_varchar2 (p_path   => 'rows[1].sid')
		      );
END;
*/
CREATE OR REPLACE function rest_parcel
( p_id_dzew in varchar2) return varchar2 is
  req utl_http.req;
  res utl_http.resp;
  url varchar2(4000) := 'http://localhost:3000/parcel/'||p_id_dzew;
  name varchar2(4000);
  buffer varchar2(4000); 
  content varchar2(4000);
begin
  req := utl_http.begin_request(url, 'GET',' HTTP/1.1');
  utl_http.set_header(req, 'user-agent', 'mozilla/4.0'); 
  utl_http.set_header(req, 'content-type', 'application/json'); 
   
  utl_http.write_text(req, content);
  res := utl_http.get_response(req);
  -- process the response from the HTTP call
  begin
    loop
      utl_http.read_line(res, buffer);
     content := content || buffer;
    end loop;
    utl_http.end_response(res);
    dbms_output.put_line(buffer);
   RETURN content;
  exception
    when utl_http.end_of_body  then
      utl_http.end_response(res);
      RETURN content;
	WHEN OTHERS THEN
	  RETURN NULL;
  end;
end rest_parcel;
