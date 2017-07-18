function [ result ] = getLabel( path )
%%
%   ָ��ѵ��ͼ���·��path
%   ÿһ��ͼ���Ӧһ������ 64���ַ�
%   ��󽫱�ǩת��Ϊһ������
files = ls(path);
result = repmat('',64,1);
for fname = files'
    name = fname';
    data = '';
    if strcmp(strtrim(name(strfind(name,'.')+1:end)),'gif')
        disp(name)
        for c = name
            if c == '.'
                break;
            end
            if c >= '1' && c <= '8'
                data = strcat(data,repmat('E',1,str2double(c)));
            elseif c ~= '_'
               data=strcat(data,c); 
            end
        end
    end
    disp(data);
    result = strcat(result, data');
end
 result  = reshape(result, 1, 64*200);
end

