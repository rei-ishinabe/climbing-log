const dynamicDropDown = () => {
  const category = document.getElementById("route_category_id");
  const grade = document.getElementById("route_grade_id");
  const subGrade = document.getElementById("route_sub_grade_id");
  category.addEventListener("change",(event)=> {
    const value = category.options[category.selectedIndex].value;
    if (value === '1') {
      grade.innerHTML = "";
      grade.insertAdjacentHTML('beforeend','<option>グレードを選択</option>');
      grade.insertAdjacentHTML('beforeend',"<option value='1'>9級</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='2'>8級</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='3'>7級</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='4'>6級</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='5'>5級</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='6'>4級</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='7'>3級</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='8'>2級</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='9'>1級</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='10'>初段</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='11'>2段</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='12'>3段</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='13'>4段</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='14'>5段</option>");
      subGrade.innerHTML = "";
      subGrade.insertAdjacentHTML('beforeend','<option value="">サブグレード(オプション)</option>');
      subGrade.insertAdjacentHTML('beforeend',"<option value='1'>+</option>");
    } else {
      grade.innerHTML = "";
      grade.insertAdjacentHTML('beforeend','<option>グレードを選択</option>');
      grade.insertAdjacentHTML('beforeend',"<option value='15'>5.5</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='16'>5.6</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='17'>5.7</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='18'>5.8</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='19'>5.9</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='20'>5.10</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='21'>5.11</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='22'>5.12</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='23'>5.13</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='24'>5.14</option>");
      grade.insertAdjacentHTML('beforeend',"<option value='25'>5.15</option>");
      subGrade.innerHTML = "";
      subGrade.insertAdjacentHTML('beforeend','<option value="">サブグレード(オプション)</option>');
      subGrade.insertAdjacentHTML('beforeend',"<option value='2'>a</option>");
      subGrade.insertAdjacentHTML('beforeend',"<option value='3'>a/b</option>");
      subGrade.insertAdjacentHTML('beforeend',"<option value='4'>b</option>");
      subGrade.insertAdjacentHTML('beforeend',"<option value='5'>b/c</option>");
      subGrade.insertAdjacentHTML('beforeend',"<option value='6'>c</option>");
      subGrade.insertAdjacentHTML('beforeend',"<option value='7'>c/d</option>");
      subGrade.insertAdjacentHTML('beforeend',"<option value='8'>d</option>");
    }
  });
}

export {dynamicDropDown};
