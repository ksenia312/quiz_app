import 'package:my_great_app/features/quiz/domain/quiz_repository.dart';

const quizData = <Data>[AnimalData(), FlowerData()];

class AnimalData extends Data {
  const AnimalData()
      : super(
          id: 1,
          name: 'Какое ты животное?',
          questions: const [
            Question(
              name: 'Как вы предпочитаете проводить свободное время?',
              variants: [
                'Спать или отдыхать',
                'Исследовать новые места или пробовать новые вещи',
                'Общаться с друзьями или семьей',
                'Заниматься любимым хобби или интересом.'
              ],
            ),
            Question(
              name: 'Как бы вы описали свой характер?',
              variants: [
                'Спокойный и расслабленный',
                'Любопытный и авантюрный',
                'Общительный и коммуникабельный',
                'Целенаправленный и целеустремленный'
              ],
            ),
            Question(
              name: 'В какой обстановке вы чувствуете себя наиболее комфортно?',
              variants: [
                'Тихая и спокойная',
                'Широкие открытые пространства или природные условия',
                'Многолюдные или оживленные места',
                'Хорошо организованное и эффективное рабочее пространство.'
              ],
            ),
            Question(
              name: 'Какой тип еды вам больше всего нравится?',
              variants: [
                'Что-то легкое и здоровое',
                'Острая или экзотическая кухня',
                'Комфортная еда или классические блюда',
                'Что-то уникальное или изысканное'
              ],
            ),
            Question(
              name: 'Как вы справляетесь со стрессовыми ситуациями?',
              variants: [
                'Вздремнуть или найти тихое место для отдыха',
                'Встретившись лицом к лицу с ситуацией и найдя решение',
                'Обращаясь за поддержкой к друзьям или близким людям',
                'Направить стресс на продуктивную деятельность или хобби.'
              ],
            ),
            Question(
              name: 'Какая погода вам больше всего нравится?',
              variants: [
                'Солнечная и теплая',
                'Прохладная и хрустящая',
                'Дождливая или бурная',
                'Снежная или ветреная'
              ],
            ),
          ],
          results: const [
            Result(points: 1, value: 'Ленивец'),
            Result(points: 2, value: 'Выдра'),
            Result(points: 3, value: 'Собака'),
            Result(points: 4, value: 'Волк'),
            Result(points: 5, value: 'Кошка'),
            Result(points: 6, value: 'Улитка'),
            Result(points: 7, value: 'Черепаха'),
            Result(points: 8, value: 'Мышь'),
            Result(points: 9, value: 'Хомяк'),
            Result(points: 10, value: 'Кролик'),
            Result(points: 11, value: 'Белка'),
            Result(points: 12, value: 'Енот'),
            Result(points: 13, value: 'Лиса'),
            Result(points: 14, value: 'Скунс'),
            Result(points: 15, value: 'Ёж'),
            Result(points: 16, value: 'Олень'),
            Result(points: 17, value: 'Антилопа'),
            Result(points: 18, value: 'Койот'),
            Result(points: 19, value: 'Медведь'),
            Result(points: 20, value: 'Горилла'),
            Result(points: 21, value: 'Лев'),
            Result(points: 22, value: 'Леопард'),
            Result(points: 23, value: 'Тигр'),
            Result(points: 24, value: 'Дракон')
          ],
        );
}

class FlowerData extends Data {
  const FlowerData()
      : super(
          id: 2,
          name: 'Какой ты цветок?',
          questions: const [
            Question(
              name: 'Какое место ты предпочитаешь?',
              variants: [
                'В солнечном саду или на пляже',
                'В горах или в лесу',
                'В парке или на стадионе',
                'Дома или на работе'
              ],
            ),
            Question(
              name: 'Какую музыку ты предпочитаешь?',
              variants: [
                'Классическую или джаз',
                'Рок или поп',
                'Кантри или блюз',
                'Электронную или рэп'
              ],
            ),
            Question(
              name: 'Какой цвет тебе нравится больше всего?',
              variants: [
                'Красный или оранжевый',
                'Желтый или зеленый',
                'Синий или фиолетовый',
                'Белый или черный'
              ],
            ),
            Question(
              name: 'Что ты любишь делать в свободное время?',
              variants: [
                'Читать книги или смотреть фильмы',
                'Путешествовать или заниматься спортом',
                'Встречаться с друзьями или семьей',
                'Заниматься рукоделием или кулинарией'
              ],
            ),
            Question(
              name: 'Какой запах тебе больше всего нравится?',
              variants: [
                'Цветущие цветы или свежескошенная трава',
                'Морской воздух или хвойный лес',
                'Поле после дождя или свежесваренный кофе',
                'Свежий хлеб или свежесрезанный лимон'
              ],
            ),
            Question(
              name: 'Какой вид спорта тебе нравится больше всего?',
              variants: [
                'Йога или пилатес',
                'Горные лыжи или сноуборд',
                'Бег или плавание',
                'Велоспорт или гольф'
              ],
            ),
          ],
          results: const [
            Result(points: 1, value: 'Роза'),
            Result(points: 2, value: 'Лилия'),
            Result(points: 3, value: 'Орхидея'),
            Result(points: 4, value: 'Тюльпан'),
            Result(points: 5, value: 'Хризантема'),
            Result(points: 6, value: 'Гиацинт'),
            Result(points: 7, value: 'Ирис'),
            Result(points: 8, value: 'Фиалка'),
            Result(points: 9, value: 'Герань'),
            Result(points: 10, value: 'Лютик'),
            Result(points: 11, value: 'Пион'),
            Result(points: 12, value: 'Амарант'),
            Result(points: 13, value: 'Календула'),
            Result(points: 14, value: 'Колокольчик'),
            Result(points: 15, value: 'Нарцисс'),
            Result(points: 16, value: 'Петуния'),
            Result(points: 17, value: 'Сирень'),
            Result(points: 18, value: 'Шиповник'),
            Result(points: 19, value: 'Клематис'),
            Result(points: 20, value: 'Магнолия'),
            Result(points: 21, value: 'Бегония'),
            Result(points: 22, value: 'Фуксия'),
            Result(points: 23, value: 'Астра'),
            Result(points: 24, value: 'Гладиолус'),
          ],
        );
}
