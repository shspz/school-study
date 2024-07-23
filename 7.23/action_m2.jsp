<tr><td>상품명</td>
<td><input type="text" name="goods_nm"></td></tr>
<tr><td>단가</td>
<td><input type="text" name="goods_price"></td></tr>
<tr><td>원가</td>
<td><input type="text" name="cost"></td></tr>
<tr><td>입고일자(자동세팅)</td>
<td><input type="date" name="in-date"
value="<%=ddd %>" readonly="readonly"></td></tr>
<tr><td colspan=2 style='text-align:center;'>
<input type="submit" value="저장" onclick="return aaa();">
<input type="button" value="상품목록" onclick="location.href='list_m2.jsp""> </td></tr>