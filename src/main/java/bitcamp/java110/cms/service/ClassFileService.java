package bitcamp.java110.cms.service;

import java.util.List;
import bitcamp.java110.cms.domain.ClassFile;

public interface ClassFileService {
  List<ClassFile> list(int pageNo, int pageSize);
  ClassFile get(int no);
  void delete(int no);
  int update(ClassFile cfile);
  List<ClassFile> findByCno(int cno);
}
