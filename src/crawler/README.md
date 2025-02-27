# Search Engine Crawler

Поисковый бот для сбора текстовой информации с веб-страниц и ссылок.

Бот помещает в очередь `url` переданный ему при запуске. Затем он начинает обрабатывать все `url` в очереди. Для каждого `url` бот загружает содержимое страницы, записывая в БД связи между сайтами, между сайтами и словами. Все найденые на странице `url` помещает обратно в очередь.

## Необходимые компоненты

* Python 3

Для запуска бота нужно установить дополнительные компоненты python командой
```
pip install -r requirements.txt
```

Для работы бота нужны запущенные сервисы `mongodb` и `rabbitmq`

## Запуск бота
### Переменные окружения
* `MONGO` - адрес `mongodb`-хоста
* `MONGO_PORT` - порт для подключения к `mongodb`-хосту
* `RMQ_HOST` - адрес `rabbitmq`-хоста
* `RMQ_QUEUE` - имя очереди `rabbitmq`
* `RMQ_USERNAME` - пользователь для подключения к `rabbitmq`-серверу
* `RMQ_PASSWORD` - пароль пользователя
* `CHECK_INTERVAL` - минимальное время между повторными проверками одного и того же `url`
* `EXCLUDE_URLS` - адреса которые будут исключены из обхода записанные через запятую в формате простых регулярных выражений.

### Параметры командной строки
* `URL` - `url` который будет помещен в очередь при старте бота

### Пример для запуска
В общем случае бота можно запустить с помощью команды
```
python -u crawler/crawler.py URL
```

Для проверки работы бота крайне рекомендуется запускать бота указывая `url` специально подготовленного сайта `https://vitkhab.github.io/search_engine_test_site/` и установленной переменной окружения `EXCLUDE_URLS='.*github.com'`. Сделать это можно с помощью команды
```
EXCLUDE_URLS='.*github.com' python -u crawler/crawler.py https://vitkhab.github.io/search_engine_test_site/
```
!!!ВАЖНО!!! Пока бот тупенький, он лезет куда может дотянуться и не знает о правилах поведения ботов. Неконтроллируемый запуск бота может привести к временной блокировке на веб-ресурсах которые обрабатывал бот. Случаев блокировки при выполнении команды выше замеченно не было.

## Тестирование
### Необходимые компоненты
Для тестирования необходимо установить дополнительные компоненты с помщью команды
```
pip install -r requirements.txt -r requirements-test.txt
```

### Тестирование
Базовая команда для запуска unit-тестов
```
python -m unittest discover -s tests/
```

Команды для генерации отчета о покрытии кода тестами
```
coverage run -m unittest discover -s tests/
coverage report --include crawler/crawler.py
```

## Мониторинг
Метрики для снятия `prometheus` доступны по адресу `http://HOST_IP:8000/`, где `HOST_IP` - адрес хоста на котором запущен бот.

### Метрики
* `crawler_pages_parsed` - количество обработанных ботом страниц
* `crawler_site_connection_time` - время затраченное ботом на подключение к веб-сайту и загрузку веб-страницы
* `crawler_page_parse_time` - время затраченное ботом на обработку содержимого веб-страницы

## Логиование
Бот отправляет логи в `json`-формате в `stdout`
