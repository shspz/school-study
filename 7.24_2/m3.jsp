select ap.p_no, ap.p_name, al.t_name, ar.t_sdate, 
case ar.t_status when '1' then '검사 중'
    else  '검사 완료' end,
ar.t_ldate,
case ar.t_result when 'X' then '미입력'
    when 'P' then '양성'
    when 'N' then '음성' end
from ai_patient ap,ai_lab_test al,ai_result ar
where ap.p_no = ar.p_no and al.t_code = ar.t_code;
