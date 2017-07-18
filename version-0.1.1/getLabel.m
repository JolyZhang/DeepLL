function [ result ] = getLabel( path )
%%
%   指定训练图像的路径path
%   每一幅图像对应一列数据 64个字符
%   最后将标签转化为一行向量
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

