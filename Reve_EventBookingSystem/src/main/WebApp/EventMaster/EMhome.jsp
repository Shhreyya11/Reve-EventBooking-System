<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- JSTL Tags for Dynamic Table and date formatting -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rêve - Event Master</title>
    <link rel="icon" href="../images/butterfly.ico">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    
    <!-- Icons -->
    <script src="data:application/octet-stream;base64,d2luZG93LkZvbnRBd2Vzb21lS2l0Q29uZmlnID0geyJhc3luY0xvYWRpbmciOnsiZW5hYmxlZCI6ZmFsc2V9LCJhdXRvQTExeSI6eyJlbmFibGVkIjp0cnVlfSwiYmFzZVVybCI6Imh0dHBzOi8va2EtZi5mb250YXdlc29tZS5jb20iLCJiYXNlVXJsS2l0IjoiaHR0cHM6Ly9raXQuZm9udGF3ZXNvbWUuY29tIiwiZGV0ZWN0Q29uZmxpY3RzVW50aWwiOm51bGwsImljb25VcGxvYWRzIjp7fSwiaWQiOjEwMzUwNDk2MSwibGljZW5zZSI6ImZyZWUiLCJtZXRob2QiOiJjc3MiLCJtaW5pZnkiOnsiZW5hYmxlZCI6dHJ1ZX0sInRva2VuIjoiZjRmZThjMTI3ZiIsInY0Rm9udEZhY2VTaGltIjp7ImVuYWJsZWQiOnRydWV9LCJ2NHNoaW0iOnsiZW5hYmxlZCI6dHJ1ZX0sInY1Rm9udEZhY2VTaGltIjp7ImVuYWJsZWQiOnRydWV9LCJ2ZXJzaW9uIjoiNi4xLjEifTsKIWZ1bmN0aW9uKHQpeyJmdW5jdGlvbiI9PXR5cGVvZiBkZWZpbmUmJmRlZmluZS5hbWQ/ZGVmaW5lKCJraXQtbG9hZGVyIix0KTp0KCl9KChmdW5jdGlvbigpeyJ1c2Ugc3RyaWN0IjtmdW5jdGlvbiB0KGUpe3JldHVybih0PSJmdW5jdGlvbiI9PXR5cGVvZiBTeW1ib2wmJiJzeW1ib2wiPT10eXBlb2YgU3ltYm9sLml0ZXJhdG9yP2Z1bmN0aW9uKHQpe3JldHVybiB0eXBlb2YgdH06ZnVuY3Rpb24odCl7cmV0dXJuIHQmJiJmdW5jdGlvbiI9PXR5cGVvZiBTeW1ib2wmJnQuY29uc3RydWN0b3I9PT1TeW1ib2wmJnQhPT1TeW1ib2wucHJvdG90eXBlPyJzeW1ib2wiOnR5cGVvZiB0fSkoZSl9ZnVuY3Rpb24gZSh0LGUsbil7cmV0dXJuIGUgaW4gdD9PYmplY3QuZGVmaW5lUHJvcGVydHkodCxlLHt2YWx1ZTpuLGVudW1lcmFibGU6ITAsY29uZmlndXJhYmxlOiEwLHdyaXRhYmxlOiEwfSk6dFtlXT1uLHR9ZnVuY3Rpb24gbih0LGUpe3ZhciBuPU9iamVjdC5rZXlzKHQpO2lmKE9iamVjdC5nZXRPd25Qcm9wZXJ0eVN5bWJvbHMpe3ZhciBvPU9iamVjdC5nZXRPd25Qcm9wZXJ0eVN5bWJvbHModCk7ZSYmKG89by5maWx0ZXIoKGZ1bmN0aW9uKGUpe3JldHVybiBPYmplY3QuZ2V0T3duUHJvcGVydHlEZXNjcmlwdG9yKHQsZSkuZW51bWVyYWJsZX0pKSksbi5wdXNoLmFwcGx5KG4sbyl9cmV0dXJuIG59ZnVuY3Rpb24gbyh0KXtmb3IodmFyIG89MTtvPGFyZ3VtZW50cy5sZW5ndGg7bysrKXt2YXIgcj1udWxsIT1hcmd1bWVudHNbb10/YXJndW1lbnRzW29dOnt9O28lMj9uKE9iamVjdChyKSwhMCkuZm9yRWFjaCgoZnVuY3Rpb24obil7ZSh0LG4scltuXSl9KSk6T2JqZWN0LmdldE93blByb3BlcnR5RGVzY3JpcHRvcnM/T2JqZWN0LmRlZmluZVByb3BlcnRpZXModCxPYmplY3QuZ2V0T3duUHJvcGVydHlEZXNjcmlwdG9ycyhyKSk6bihPYmplY3QocikpLmZvckVhY2goKGZ1bmN0aW9uKGUpe09iamVjdC5kZWZpbmVQcm9wZXJ0eSh0LGUsT2JqZWN0LmdldE93blByb3BlcnR5RGVzY3JpcHRvcihyLGUpKX0pKX1yZXR1cm4gdH1mdW5jdGlvbiByKHQsZSl7cmV0dXJuIGZ1bmN0aW9uKHQpe2lmKEFycmF5LmlzQXJyYXkodCkpcmV0dXJuIHR9KHQpfHxmdW5jdGlvbih0LGUpe2lmKCJ1bmRlZmluZWQiPT10eXBlb2YgU3ltYm9sfHwhKFN5bWJvbC5pdGVyYXRvciBpbiBPYmplY3QodCkpKXJldHVybjt2YXIgbj1bXSxvPSEwLHI9ITEsaT12b2lkIDA7dHJ5e2Zvcih2YXIgYyxhPXRbU3ltYm9sLml0ZXJhdG9yXSgpOyEobz0oYz1hLm5leHQoKSkuZG9uZSkmJihuLnB1c2goYy52YWx1ZSksIWV8fG4ubGVuZ3RoIT09ZSk7bz0hMCk7fWNhdGNoKHQpe3I9ITAsaT10fWZpbmFsbHl7dHJ5e298fG51bGw9PWEucmV0dXJufHxhLnJldHVybigpfWZpbmFsbHl7aWYocil0aHJvdyBpfX1yZXR1cm4gbn0odCxlKXx8ZnVuY3Rpb24odCxlKXtpZighdClyZXR1cm47aWYoInN0cmluZyI9PXR5cGVvZiB0KXJldHVybiBpKHQsZSk7dmFyIG49T2JqZWN0LnByb3RvdHlwZS50b1N0cmluZy5jYWxsKHQpLnNsaWNlKDgsLTEpOyJPYmplY3QiPT09biYmdC5jb25zdHJ1Y3RvciYmKG49dC5jb25zdHJ1Y3Rvci5uYW1lKTtpZigiTWFwIj09PW58fCJTZXQiPT09bilyZXR1cm4gQXJyYXkuZnJvbSh0KTtpZigiQXJndW1lbnRzIj09PW58fC9eKD86VWl8SSludCg/Ojh8MTZ8MzIpKD86Q2xhbXBlZCk/QXJyYXkkLy50ZXN0KG4pKXJldHVybiBpKHQsZSl9KHQsZSl8fGZ1bmN0aW9uKCl7dGhyb3cgbmV3IFR5cGVFcnJvcigiSW52YWxpZCBhdHRlbXB0IHRvIGRlc3RydWN0dXJlIG5vbi1pdGVyYWJsZSBpbnN0YW5jZS5cbkluIG9yZGVyIHRvIGJlIGl0ZXJhYmxlLCBub24tYXJyYXkgb2JqZWN0cyBtdXN0IGhhdmUgYSBbU3ltYm9sLml0ZXJhdG9yXSgpIG1ldGhvZC4iKX0oKX1mdW5jdGlvbiBpKHQsZSl7KG51bGw9PWV8fGU+dC5sZW5ndGgpJiYoZT10Lmxlbmd0aCk7Zm9yKHZhciBuPTAsbz1uZXcgQXJyYXkoZSk7bjxlO24rKylvW25dPXRbbl07cmV0dXJuIG99ZnVuY3Rpb24gYyh0LGUpe3ZhciBuPWUmJmUuYWRkT258fCIiLG89ZSYmZS5iYXNlRmlsZW5hbWV8fHQubGljZW5zZStuLHI9ZSYmZS5taW5pZnk/Ii5taW4iOiIiLGk9ZSYmZS5maWxlU3VmZml4fHx0Lm1ldGhvZCxjPWUmJmUuc3ViZGlyfHx0Lm1ldGhvZDtyZXR1cm4gdC5iYXNlVXJsKyIvcmVsZWFzZXMvIisoImxhdGVzdCI9PT10LnZlcnNpb24/ImxhdGVzdCI6InYiLmNvbmNhdCh0LnZlcnNpb24pKSsiLyIrYysiLyIrbytyKyIuIitpfWZ1bmN0aW9uIGEodCl7cmV0dXJuIHQuYmFzZVVybEtpdCsiLyIrdC50b2tlbisiLyIrdC5pZCsiL2tpdC11cGxvYWQuY3NzIn1mdW5jdGlvbiB1KHQsZSl7dmFyIG49ZXx8WyJmYSJdLG89Ii4iK0FycmF5LnByb3RvdHlwZS5qb2luLmNhbGwobiwiLC4iKSxyPXQucXVlcnlTZWxlY3RvckFsbChvKTtBcnJheS5wcm90b3R5cGUuZm9yRWFjaC5jYWxsKHIsKGZ1bmN0aW9uKGUpe3ZhciBuPWUuZ2V0QXR0cmlidXRlKCJ0aXRsZSIpO2Uuc2V0QXR0cmlidXRlKCJhcmlhLWhpZGRlbiIsInRydWUiKTt2YXIgbz0hZS5uZXh0RWxlbWVudFNpYmxpbmd8fCFlLm5leHRFbGVtZW50U2libGluZy5jbGFzc0xpc3QuY29udGFpbnMoInNyLW9ubHkiKTtpZihuJiZvKXt2YXIgcj10LmNyZWF0ZUVsZW1lbnQoInNwYW4iKTtyLmlubmVySFRNTD1uLHIuY2xhc3NMaXN0LmFkZCgic3Itb25seSIpLGUucGFyZW50Tm9kZS5pbnNlcnRCZWZvcmUocixlLm5leHRTaWJsaW5nKX19KSl9dmFyIGYscz1mdW5jdGlvbigpe30sZD0idW5kZWZpbmVkIiE9dHlwZW9mIGdsb2JhbCYmdm9pZCAwIT09Z2xvYmFsLnByb2Nlc3MmJiJmdW5jdGlvbiI9PXR5cGVvZiBnbG9iYWwucHJvY2Vzcy5lbWl0LGw9InVuZGVmaW5lZCI9PXR5cGVvZiBzZXRJbW1lZGlhdGU/c2V0VGltZW91dDpzZXRJbW1lZGlhdGUsaD1bXTtmdW5jdGlvbiBtKCl7Zm9yKHZhciB0PTA7dDxoLmxlbmd0aDt0KyspaFt0XVswXShoW3RdWzFdKTtoPVtdLGY9ITF9ZnVuY3Rpb24gcCh0LGUpe2gucHVzaChbdCxlXSksZnx8KGY9ITAsbChtLDApKX1mdW5jdGlvbiB2KHQpe3ZhciBlPXQub3duZXIsbj1lLl9zdGF0ZSxvPWUuX2RhdGEscj10W25dLGk9dC50aGVuO2lmKCJmdW5jdGlvbiI9PXR5cGVvZiByKXtuPSJmdWxmaWxsZWQiO3RyeXtvPXIobyl9Y2F0Y2godCl7dyhpLHQpfX15KGksbyl8fCgiZnVsZmlsbGVkIj09PW4mJmIoaSxvKSwicmVqZWN0ZWQiPT09biYmdyhpLG8pKX1mdW5jdGlvbiB5KGUsbil7dmFyIG87dHJ5e2lmKGU9PT1uKXRocm93IG5ldyBUeXBlRXJyb3IoIkEgcHJvbWlzZXMgY2FsbGJhY2sgY2Fubm90IHJldHVybiB0aGF0IHNhbWUgcHJvbWlzZS4iKTtpZihuJiYoImZ1bmN0aW9uIj09dHlwZW9mIG58fCJvYmplY3QiPT09dChuKSkpe3ZhciByPW4udGhlbjtpZigiZnVuY3Rpb24iPT10eXBlb2YgcilyZXR1cm4gci5jYWxsKG4sKGZ1bmN0aW9uKHQpe298fChvPSEwLG49PT10P2coZSx0KTpiKGUsdCkpfSksKGZ1bmN0aW9uKHQpe298fChvPSEwLHcoZSx0KSl9KSksITB9fWNhdGNoKHQpe3JldHVybiBvfHx3KGUsdCksITB9cmV0dXJuITF9ZnVuY3Rpb24gYih0LGUpe3QhPT1lJiZ5KHQsZSl8fGcodCxlKX1mdW5jdGlvbiBnKHQsZSl7InBlbmRpbmciPT09dC5fc3RhdGUmJih0Ll9zdGF0ZT0ic2V0dGxlZCIsdC5fZGF0YT1lLHAoUyx0KSl9ZnVuY3Rpb24gdyh0LGUpeyJwZW5kaW5nIj09PXQuX3N0YXRlJiYodC5fc3RhdGU9InNldHRsZWQiLHQuX2RhdGE9ZSxwKE8sdCkpfWZ1bmN0aW9uIEEodCl7dC5fdGhlbj10Ll90aGVuLmZvckVhY2godil9ZnVuY3Rpb24gUyh0KXt0Ll9zdGF0ZT0iZnVsZmlsbGVkIixBKHQpfWZ1bmN0aW9uIE8odCl7dC5fc3RhdGU9InJlamVjdGVkIixBKHQpLCF0Ll9oYW5kbGVkJiZkJiZnbG9iYWwucHJvY2Vzcy5lbWl0KCJ1bmhhbmRsZWRSZWplY3Rpb24iLHQuX2RhdGEsdCl9ZnVuY3Rpb24gaih0KXtnbG9iYWwucHJvY2Vzcy5lbWl0KCJyZWplY3Rpb25IYW5kbGVkIix0KX1mdW5jdGlvbiBFKHQpe2lmKCJmdW5jdGlvbiIhPXR5cGVvZiB0KXRocm93IG5ldyBUeXBlRXJyb3IoIlByb21pc2UgcmVzb2x2ZXIgIit0KyIgaXMgbm90IGEgZnVuY3Rpb24iKTtpZih0aGlzIGluc3RhbmNlb2YgRT09ITEpdGhyb3cgbmV3IFR5cGVFcnJvcigiRmFpbGVkIHRvIGNvbnN0cnVjdCAnUHJvbWlzZSc6IFBsZWFzZSB1c2UgdGhlICduZXcnIG9wZXJhdG9yLCB0aGlzIG9iamVjdCBjb25zdHJ1Y3RvciBjYW5ub3QgYmUgY2FsbGVkIGFzIGEgZnVuY3Rpb24uIik7dGhpcy5fdGhlbj1bXSxmdW5jdGlvbih0LGUpe2Z1bmN0aW9uIG4odCl7dyhlLHQpfXRyeXt0KChmdW5jdGlvbih0KXtiKGUsdCl9KSxuKX1jYXRjaCh0KXtuKHQpfX0odCx0aGlzKX1FLnByb3RvdHlwZT17Y29uc3RydWN0b3I6RSxfc3RhdGU6InBlbmRpbmciLF90aGVuOm51bGwsX2RhdGE6dm9pZCAwLF9oYW5kbGVkOiExLHRoZW46ZnVuY3Rpb24odCxlKXt2YXIgbj17b3duZXI6dGhpcyx0aGVuOm5ldyB0aGlzLmNvbnN0cnVjdG9yKHMpLGZ1bGZpbGxlZDp0LHJlamVjdGVkOmV9O3JldHVybiFlJiYhdHx8dGhpcy5faGFuZGxlZHx8KHRoaXMuX2hhbmRsZWQ9ITAsInJlamVjdGVkIj09PXRoaXMuX3N0YXRlJiZkJiZwKGosdGhpcykpLCJmdWxmaWxsZWQiPT09dGhpcy5fc3RhdGV8fCJyZWplY3RlZCI9PT10aGlzLl9zdGF0ZT9wKHYsbik6dGhpcy5fdGhlbi5wdXNoKG4pLG4udGhlbn0sY2F0Y2g6ZnVuY3Rpb24odCl7cmV0dXJuIHRoaXMudGhlbihudWxsLHQpfX0sRS5hbGw9ZnVuY3Rpb24odCl7aWYoIUFycmF5LmlzQXJyYXkodCkpdGhyb3cgbmV3IFR5cGVFcnJvcigiWW91IG11c3QgcGFzcyBhbiBhcnJheSB0byBQcm9taXNlLmFsbCgpLiIpO3JldHVybiBuZXcgRSgoZnVuY3Rpb24oZSxuKXt2YXIgbz1bXSxyPTA7ZnVuY3Rpb24gaSh0KXtyZXR1cm4gcisrLGZ1bmN0aW9uKG4pe29bdF09biwtLXJ8fGUobyl9fWZvcih2YXIgYyxhPTA7YTx0Lmxlbmd0aDthKyspKGM9dFthXSkmJiJmdW5jdGlvbiI9PXR5cGVvZiBjLnRoZW4/Yy50aGVuKGkoYSksbik6b1thXT1jO3J8fGUobyl9KSl9LEUucmFjZT1mdW5jdGlvbih0KXtpZighQXJyYXkuaXNBcnJheSh0KSl0aHJvdyBuZXcgVHlwZUVycm9yKCJZb3UgbXVzdCBwYXNzIGFuIGFycmF5IHRvIFByb21pc2UucmFjZSgpLiIpO3JldHVybiBuZXcgRSgoZnVuY3Rpb24oZSxuKXtmb3IodmFyIG8scj0wO3I8dC5sZW5ndGg7cisrKShvPXRbcl0pJiYiZnVuY3Rpb24iPT10eXBlb2Ygby50aGVuP28udGhlbihlLG4pOmUobyl9KSl9LEUucmVzb2x2ZT1mdW5jdGlvbihlKXtyZXR1cm4gZSYmIm9iamVjdCI9PT10KGUpJiZlLmNvbnN0cnVjdG9yPT09RT9lOm5ldyBFKChmdW5jdGlvbih0KXt0KGUpfSkpfSxFLnJlamVjdD1mdW5jdGlvbih0KXtyZXR1cm4gbmV3IEUoKGZ1bmN0aW9uKGUsbil7bih0KX0pKX07dmFyIF89ImZ1bmN0aW9uIj09dHlwZW9mIFByb21pc2U/UHJvbWlzZTpFO2Z1bmN0aW9uIEYodCxlKXt2YXIgbj1lLmZldGNoLG89ZS5YTUxIdHRwUmVxdWVzdCxyPWUudG9rZW4saT10O3JldHVybiJVUkxTZWFyY2hQYXJhbXMiaW4gd2luZG93PyhpPW5ldyBVUkwodCkpLnNlYXJjaFBhcmFtcy5zZXQoInRva2VuIixyKTppPWkrIj90b2tlbj0iK2VuY29kZVVSSUNvbXBvbmVudChyKSxpPWkudG9TdHJpbmcoKSxuZXcgXygoZnVuY3Rpb24odCxlKXtpZigiZnVuY3Rpb24iPT10eXBlb2YgbiluKGkse21vZGU6ImNvcnMiLGNhY2hlOiJkZWZhdWx0In0pLnRoZW4oKGZ1bmN0aW9uKHQpe2lmKHQub2spcmV0dXJuIHQudGV4dCgpO3Rocm93IG5ldyBFcnJvcigiIil9KSkudGhlbigoZnVuY3Rpb24oZSl7dChlKX0pKS5jYXRjaChlKTtlbHNlIGlmKCJmdW5jdGlvbiI9PXR5cGVvZiBvKXt2YXIgcj1uZXcgbztyLmFkZEV2ZW50TGlzdGVuZXIoImxvYWRlbmQiLChmdW5jdGlvbigpe3RoaXMucmVzcG9uc2VUZXh0P3QodGhpcy5yZXNwb25zZVRleHQpOmUobmV3IEVycm9yKCIiKSl9KSk7WyJhYm9ydCIsImVycm9yIiwidGltZW91dCJdLm1hcCgoZnVuY3Rpb24odCl7ci5hZGRFdmVudExpc3RlbmVyKHQsKGZ1bmN0aW9uKCl7ZShuZXcgRXJyb3IoIiIpKX0pKX0pKSxyLm9wZW4oIkdFVCIsaSksci5zZW5kKCl9ZWxzZXtlKG5ldyBFcnJvcigiIikpfX0pKX1mdW5jdGlvbiBQKHQsZSxuKXt2YXIgbz10O3JldHVybltbLyh1cmxcKCI/KVwuXC5cL1wuXC5cL1wuXC4vZyxmdW5jdGlvbih0LG4pe3JldHVybiIiLmNvbmNhdChuKS5jb25jYXQoZSl9XSxbLyh1cmxcKCI/KVwuXC5cL3dlYmZvbnRzL2csZnVuY3Rpb24odCxvKXtyZXR1cm4iIi5jb25jYXQobykuY29uY2F0KGUsIi9yZWxlYXNlcy92IikuY29uY2F0KG4sIi93ZWJmb250cyIpfV0sWy8odXJsXCgiPylodHRwczpcL1wva2l0LWZyZWUoW14uXSkqXC5mb250YXdlc29tZVwuY29tL2csZnVuY3Rpb24odCxuKXtyZXR1cm4iIi5jb25jYXQobikuY29uY2F0KGUpfV1dLmZvckVhY2goKGZ1bmN0aW9uKHQpe3ZhciBlPXIodCwyKSxuPWVbMF0saT1lWzFdO289by5yZXBsYWNlKG4saSl9KSksb31mdW5jdGlvbiBDKHQsZSl7dmFyIG49YXJndW1lbnRzLmxlbmd0aD4yJiZ2b2lkIDAhPT1hcmd1bWVudHNbMl0/YXJndW1lbnRzWzJdOmZ1bmN0aW9uKCl7fSxyPWUuZG9jdW1lbnR8fHIsaT11LmJpbmQodSxyLFsiZmEiLCJmYWIiLCJmYXMiLCJmYXIiLCJmYWwiLCJmYWQiLCJmYWsiXSksZj1PYmplY3Qua2V5cyh0Lmljb25VcGxvYWRzfHx7fSkubGVuZ3RoPjA7dC5hdXRvQTExeS5lbmFibGVkJiZuKGkpO3ZhciBzPVt7aWQ6ImZhLW1haW4iLGFkZE9uOnZvaWQgMH1dO3QudjRzaGltJiZ0LnY0c2hpbS5lbmFibGVkJiZzLnB1c2goe2lkOiJmYS12NC1zaGltcyIsYWRkT246Ii12NC1zaGltcyJ9KSx0LnY1Rm9udEZhY2VTaGltJiZ0LnY1Rm9udEZhY2VTaGltLmVuYWJsZWQmJnMucHVzaCh7aWQ6ImZhLXY1LWZvbnQtZmFjZSIsYWRkT246Ii12NS1mb250LWZhY2UifSksdC52NEZvbnRGYWNlU2hpbSYmdC52NEZvbnRGYWNlU2hpbS5lbmFibGVkJiZzLnB1c2goe2lkOiJmYS12NC1mb250LWZhY2UiLGFkZE9uOiItdjQtZm9udC1mYWNlIn0pLGYmJnMucHVzaCh7aWQ6ImZhLWtpdC11cGxvYWQiLGN1c3RvbUNzczohMH0pO3ZhciBkPXMubWFwKChmdW5jdGlvbihuKXtyZXR1cm4gbmV3IF8oKGZ1bmN0aW9uKHIsaSl7RihuLmN1c3RvbUNzcz9hKHQpOmModCx7YWRkT246bi5hZGRPbixtaW5pZnk6dC5taW5pZnkuZW5hYmxlZH0pLGUpLnRoZW4oKGZ1bmN0aW9uKGkpe3IoVShpLG8obyh7fSxlKSx7fSx7YmFzZVVybDp0LmJhc2VVcmwsdmVyc2lvbjp0LnZlcnNpb24saWQ6bi5pZCxjb250ZW50RmlsdGVyOmZ1bmN0aW9uKHQsZSl7cmV0dXJuIFAodCxlLmJhc2VVcmwsZS52ZXJzaW9uKX19KSkpfSkpLmNhdGNoKGkpfSkpfSkpO3JldHVybiBfLmFsbChkKX1mdW5jdGlvbiBVKHQsZSl7dmFyIG49ZS5jb250ZW50RmlsdGVyfHxmdW5jdGlvbih0LGUpe3JldHVybiB0fSxvPWRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoInN0eWxlIikscj1kb2N1bWVudC5jcmVhdGVUZXh0Tm9kZShuKHQsZSkpO3JldHVybiBvLmFwcGVuZENoaWxkKHIpLG8ubWVkaWE9ImFsbCIsZS5pZCYmby5zZXRBdHRyaWJ1dGUoImlkIixlLmlkKSxlJiZlLmRldGVjdGluZ0NvbmZsaWN0cyYmZS5kZXRlY3Rpb25JZ25vcmVBdHRyJiZvLnNldEF0dHJpYnV0ZU5vZGUoZG9jdW1lbnQuY3JlYXRlQXR0cmlidXRlKGUuZGV0ZWN0aW9uSWdub3JlQXR0cikpLG99ZnVuY3Rpb24gayh0LGUpe2UuYXV0b0ExMXk9dC5hdXRvQTExeS5lbmFibGVkLCJwcm8iPT09dC5saWNlbnNlJiYoZS5hdXRvRmV0Y2hTdmc9ITAsZS5mZXRjaFN2Z0Zyb209dC5iYXNlVXJsKyIvcmVsZWFzZXMvIisoImxhdGVzdCI9PT10LnZlcnNpb24/ImxhdGVzdCI6InYiLmNvbmNhdCh0LnZlcnNpb24pKSsiL3N2Z3MiLGUuZmV0Y2hVcGxvYWRlZFN2Z0Zyb209dC51cGxvYWRzVXJsKTt2YXIgbj1bXTtyZXR1cm4gdC52NHNoaW0uZW5hYmxlZCYmbi5wdXNoKG5ldyBfKChmdW5jdGlvbihuLHIpe0YoYyh0LHthZGRPbjoiLXY0LXNoaW1zIixtaW5pZnk6dC5taW5pZnkuZW5hYmxlZH0pLGUpLnRoZW4oKGZ1bmN0aW9uKHQpe24oSSh0LG8obyh7fSxlKSx7fSx7aWQ6ImZhLXY0LXNoaW1zIn0pKSl9KSkuY2F0Y2gocil9KSkpLG4ucHVzaChuZXcgXygoZnVuY3Rpb24obixyKXtGKGModCx7bWluaWZ5OnQubWluaWZ5LmVuYWJsZWR9KSxlKS50aGVuKChmdW5jdGlvbih0KXt2YXIgcj1JKHQsbyhvKHt9LGUpLHt9LHtpZDoiZmEtbWFpbiJ9KSk7bihmdW5jdGlvbih0LGUpe3ZhciBuPWUmJnZvaWQgMCE9PWUuYXV0b0ZldGNoU3ZnP2UuYXV0b0ZldGNoU3ZnOnZvaWQgMCxvPWUmJnZvaWQgMCE9PWUuYXV0b0ExMXk/ZS5hdXRvQTExeTp2b2lkIDA7dm9pZCAwIT09byYmdC5zZXRBdHRyaWJ1dGUoImRhdGEtYXV0by1hMTF5IixvPyJ0cnVlIjoiZmFsc2UiKTtuJiYodC5zZXRBdHRyaWJ1dGVOb2RlKGRvY3VtZW50LmNyZWF0ZUF0dHJpYnV0ZSgiZGF0YS1hdXRvLWZldGNoLXN2ZyIpKSx0LnNldEF0dHJpYnV0ZSgiZGF0YS1mZXRjaC1zdmctZnJvbSIsZS5mZXRjaFN2Z0Zyb20pLHQuc2V0QXR0cmlidXRlKCJkYXRhLWZldGNoLXVwbG9hZGVkLXN2Zy1mcm9tIixlLmZldGNoVXBsb2FkZWRTdmdGcm9tKSk7cmV0dXJuIHR9KHIsZSkpfSkpLmNhdGNoKHIpfSkpKSxfLmFsbChuKX1mdW5jdGlvbiBJKHQsZSl7dmFyIG49ZG9jdW1lbnQuY3JlYXRlRWxlbWVudCgiU0NSSVBUIiksbz1kb2N1bWVudC5jcmVhdGVUZXh0Tm9kZSh0KTtyZXR1cm4gbi5hcHBlbmRDaGlsZChvKSxuLnJlZmVycmVyUG9saWN5PSJzdHJpY3Qtb3JpZ2luIixlLmlkJiZuLnNldEF0dHJpYnV0ZSgiaWQiLGUuaWQpLGUmJmUuZGV0ZWN0aW5nQ29uZmxpY3RzJiZlLmRldGVjdGlvbklnbm9yZUF0dHImJm4uc2V0QXR0cmlidXRlTm9kZShkb2N1bWVudC5jcmVhdGVBdHRyaWJ1dGUoZS5kZXRlY3Rpb25JZ25vcmVBdHRyKSksbn1mdW5jdGlvbiBMKHQpe3ZhciBlLG49W10sbz1kb2N1bWVudCxyPW8uZG9jdW1lbnRFbGVtZW50LmRvU2Nyb2xsLGk9KHI/L15sb2FkZWR8XmMvOi9ebG9hZGVkfF5pfF5jLykudGVzdChvLnJlYWR5U3RhdGUpO2l8fG8uYWRkRXZlbnRMaXN0ZW5lcigiRE9NQ29udGVudExvYWRlZCIsZT1mdW5jdGlvbigpe2ZvcihvLnJlbW92ZUV2ZW50TGlzdGVuZXIoIkRPTUNvbnRlbnRMb2FkZWQiLGUpLGk9MTtlPW4uc2hpZnQoKTspZSgpfSksaT9zZXRUaW1lb3V0KHQsMCk6bi5wdXNoKHQpfWZ1bmN0aW9uIFQodCl7InVuZGVmaW5lZCIhPXR5cGVvZiBNdXRhdGlvbk9ic2VydmVyJiZuZXcgTXV0YXRpb25PYnNlcnZlcih0KS5vYnNlcnZlKGRvY3VtZW50LHtjaGlsZExpc3Q6ITAsc3VidHJlZTohMH0pfXRyeXtpZih3aW5kb3cuRm9udEF3ZXNvbWVLaXRDb25maWcpe3ZhciB4PXdpbmRvdy5Gb250QXdlc29tZUtpdENvbmZpZyxNPXtkZXRlY3RpbmdDb25mbGljdHM6eC5kZXRlY3RDb25mbGljdHNVbnRpbCYmbmV3IERhdGU8PW5ldyBEYXRlKHguZGV0ZWN0Q29uZmxpY3RzVW50aWwpLGRldGVjdGlvbklnbm9yZUF0dHI6ImRhdGEtZmEtZGV0ZWN0aW9uLWlnbm9yZSIsZmV0Y2g6d2luZG93LmZldGNoLHRva2VuOngudG9rZW4sWE1MSHR0cFJlcXVlc3Q6d2luZG93LlhNTEh0dHBSZXF1ZXN0LGRvY3VtZW50OmRvY3VtZW50fSxEPWRvY3VtZW50LmN1cnJlbnRTY3JpcHQsTj1EP0QucGFyZW50RWxlbWVudDpkb2N1bWVudC5oZWFkOyhmdW5jdGlvbigpe3ZhciB0PWFyZ3VtZW50cy5sZW5ndGg+MCYmdm9pZCAwIT09YXJndW1lbnRzWzBdP2FyZ3VtZW50c1swXTp7fSxlPWFyZ3VtZW50cy5sZW5ndGg+MSYmdm9pZCAwIT09YXJndW1lbnRzWzFdP2FyZ3VtZW50c1sxXTp7fTtyZXR1cm4ianMiPT09dC5tZXRob2Q/ayh0LGUpOiJjc3MiPT09dC5tZXRob2Q/Qyh0LGUsKGZ1bmN0aW9uKHQpe0wodCksVCh0KX0pKTp2b2lkIDB9KSh4LE0pLnRoZW4oKGZ1bmN0aW9uKHQpe3QubWFwKChmdW5jdGlvbih0KXt0cnl7Ti5pbnNlcnRCZWZvcmUodCxEP0QubmV4dFNpYmxpbmc6bnVsbCl9Y2F0Y2goZSl7Ti5hcHBlbmRDaGlsZCh0KX19KSksTS5kZXRlY3RpbmdDb25mbGljdHMmJkQmJkwoKGZ1bmN0aW9uKCl7RC5zZXRBdHRyaWJ1dGVOb2RlKGRvY3VtZW50LmNyZWF0ZUF0dHJpYnV0ZShNLmRldGVjdGlvbklnbm9yZUF0dHIpKTt2YXIgdD1mdW5jdGlvbih0LGUpe3ZhciBuPWRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoInNjcmlwdCIpO3JldHVybiBlJiZlLmRldGVjdGlvbklnbm9yZUF0dHImJm4uc2V0QXR0cmlidXRlTm9kZShkb2N1bWVudC5jcmVhdGVBdHRyaWJ1dGUoZS5kZXRlY3Rpb25JZ25vcmVBdHRyKSksbi5zcmM9Yyh0LHtiYXNlRmlsZW5hbWU6ImNvbmZsaWN0LWRldGVjdGlvbiIsZmlsZVN1ZmZpeDoianMiLHN1YmRpcjoianMiLG1pbmlmeTp0Lm1pbmlmeS5lbmFibGVkfSksbn0oeCxNKTtkb2N1bWVudC5ib2R5LmFwcGVuZENoaWxkKHQpfSkpfSkpLmNhdGNoKChmdW5jdGlvbih0KXtjb25zb2xlLmVycm9yKCIiLmNvbmNhdCgiRm9udCBBd2Vzb21lIEtpdDoiLCIgIikuY29uY2F0KHQpKX0pKX19Y2F0Y2godCl7Y29uc29sZS5lcnJvcigiIi5jb25jYXQoIkZvbnQgQXdlc29tZSBLaXQ6IiwiICIpLmNvbmNhdCh0KSl9fSkpOwo=" crossorigin="anonymous"></script>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Overpass:wght@100;900&family=Source+Serif+Pro:ital@0;1&family=Whisper&display=swap" rel="stylesheet">

    <!-- StyleSheets -->
    <link rel="stylesheet" href="EM.css">
</head>

<body>
  
  <!-- SIDEBAR -->    
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;" id="sidebar">
      <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <span class="fs-4"><span class="logo">Rêve</span> - Event Master</span>
      </a>

      <hr>

      <ul class="items nav nav-pills flex-column">
        <li class="nav-item">
          <a href="EMhome" class="nav-link active" aria-current="page">
              <i class="fa-solid fa-house"></i>
              Home Dashboard: View
          </a>
        </li>
        <li>
          <a href="ListOfEvents" class="nav-link link-dark">
              <i class="fa-solid fa-file-pen"></i>
              List of Events: Edit
          </a>
        </li>
        <li>
          <a href="addEvent" class="nav-link link-dark">
            <i class="fa-solid fa-calendar-plus"></i>
            Add Event
          </a>
        </li>
        <li>
          <a href="pastEvents" class="nav-link link-dark">
            <i class="fa-solid fa-list-check"></i>
            Past Events
          </a>
        </li>
        <li>
          <a href="addAdmin" class="nav-link link-dark">
            <i class="fa-solid fa-user-plus"></i>
            Add Admin
          </a>
        </li>
      </ul>
      <hr>
      <div class="dropdown">
        <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
          <i class="fa-solid fa-house-user"></i>
          Event Master
        </a>
        <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
  
          <li><a class="dropdown-item" href="EMprofile">Profile</a></li>
          <!--<li><hr class="dropdown-divider"></li>-->
          <li><a class="dropdown-item" href="EMlogin">Sign out</a></li>
        </ul>
      </div>
    </div>

    <main>
      <h1>Event Master home-page</h1>
      <p>The following are the Upcoming Events -</p>

      <!-- TABLE -->
      <table id="table">
        <!-- Headings -->
        <thead>
          <th>Event ID</th>
          <th>Event Name</th>
          <th>Venue</th>
          <th>Start</th>
          <th>End</th>
          <th>Attendance</th>
        </thead>
        
        <!-- Content -->
        <tbody>
        <c:forEach items="${events}" var="event">
          <tr> 
            <td>${event.eventID}</td>
            <td>${event.eventName}</td>
            <td>${event.venue}</td>
            <td><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${event.startDate}"/></td>
            <td><fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${event.endDate}"/></td>
            <td>${event.attendance}</td>
          </tr>
        </c:forEach>
        </tbody>
        
      </table>


    </main>

</body>
</html>