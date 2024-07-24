select pa.p_no,pa.p_name, lt,lt.t_name,
            to_char(re.t_sdate,'YYYY-MM-DD'),
            to_char(re.ldate,'YYYY-MM-DD'),
			from ai_lab_test lt, ai_patient pa, ai_result re
			where pa.p_no = re.p_no and lt.t_code = re.t_code
            
