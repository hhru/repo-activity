Утилита для подсчёта активности в репозитории по модулям и пакетам

По мотивам [HH-89381](https://jira.hh.ru/browse/HH-89381)


```
--chdir                Директория с проектом, если отличается от текущей
--debug                Отладочный режим
--exclude              Не учитывать файлы, попадающие под regexp
--nogroup              Не группировать по родительским директориям
--include              Учитывать только файлы, попадающие под regexp
--maxdepth             Скрывать записи с уровнем вложенности более N
--shift                Заменять предыдущую часть на отступы
--since                Начинать с коммита или даты, в формате git, например @{5.days.ago}
--splitmodule          Строка для разделения модуля и пакета
--wchange              Вес изменения для сортировки
--wcommit              Вес коммита для сортировки
```

Актуальные опции можно уточнить с ключом --help

## Пример использования
```
% ./repo-activity --chdir ~/hh.ru --since "2 days"
commits    changes    module:package
7          154        hh-webapp:com
7          154        hh-webapp:com/headhunter
7          154        hh-webapp:com/headhunter/webapp
7          154        hh-webapp:com/headhunter/webapp/headhunter
7          154        hh-webapp:com/headhunter/webapp/headhunter/scheduling
5          120        hh-webapp:com/headhunter/webapp/headhunter/scheduling/commands
1          69         hh-webapp:com/headhunter/webapp/headhunter/scheduling/commands/PandoraMailingContentStrategy.java
1          16         hh-webapp:com/headhunter/webapp/headhunter/scheduling/commands/DatabaseMailingContentStrategy.java
1          15         hh-webapp:com/headhunter/webapp/headhunter/scheduling/commands/MailingBlockStrategy.java
1          15         hh-webapp:com/headhunter/webapp/headhunter/scheduling/commands/MassMailingTestMailCommand.java
1          5          hh-webapp:com/headhunter/webapp/headhunter/scheduling/commands/MassMailingMailCommand.java
1          30         hh-webapp:com/headhunter/webapp/headhunter/scheduling/MassMailingService.java
1          4          hh-webapp:com/headhunter/webapp/headhunter/scheduling/MassSendingJobService.java
4          295        hh-core:ru
4          295        hh-core:ru/hh
3          282        hh-core:ru/hh/core
2          236        hh-core:ru/hh/core/persistence
1          180        hh-core:ru/hh/core/persistence/InitializingEntityTuplizer.java
2          56         hh-core:ru/hh/core/persistence/SpringAwareEntityTuplizerFactory.java
1          46         hh-core:ru/hh/core/config
1          46         hh-core:ru/hh/core/config/HibernateListenersConfig.java
1          13         hh-core:ru/hh/resume
1          13         hh-core:ru/hh/resume/ResumeLoader.java
```
