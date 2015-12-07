# Copyright (c) 2015 Harin Sanghirun

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

def int2txt(str) 
  digit_txt = ['','หนึ่ง','สอง','สาม','สี่','ห้า','หก','เจ็ด','แปด','เก้า']
  tenths_txt = ['ศูนย์','หนึ่ง','สอง','สาม','สี่','ห้า','หก','เจ็ด','แปด','เก้า']
  mag_txt = ['','สิบ','ร้อย','พัน','หมื่น','แสน','ล้าน']
  converted = ''

  digits = str.split('').reverse
  digits.each_with_index do |d,i|
    # p d + ' ' + mag_txt[i] + ' = ' + digit_txt[d.to_i] + mag_txt[i] 
    unit = digit_txt[d.to_i] 
    mag = mag_txt[i]

    unit = '' if i==1 and d=='1'#สิบ
    unit = 'ยี่' if i==1 and d=='2'#ยี่สิบ
    mag = '' if d=='0'

    converted =  unit + mag + converted
  end
  converted.gsub!('สิบหนึ่ง', 'สิบเอ็ด')
  return converted
end

def currency_to_thai_text(str)
  parts = str.split('.')
  integers = parts[0]
  int_txt = int2txt(integers)
  converted = int_txt + 'บาท'

  if parts.length == 2
    decimals = parts[1].slice(0,2)
    decimals += '0' if decimals.length == 1
    dec_txt = int2txt(decimals)
    converted = converted + dec_txt + 'สตางค์'
  else 
    converted += 'ถ้้วน'
  end
  return converted
end