//  group('factory fromMap test', () {
//       test('Correct Test', () async {
//         // Act.
//         final File file = File('test/data/models/note_model_artifacts/correct_note_model_test.JSON');
//         if (!(await file.exists())) throw Exception('File does\'t exist');

//         final String string = await file.readAsString();
//         final dynamic jsonValue = jsonDecode(string);

//         // Arrange.
//         final NoteModel? Function() result = () {
//           try {
//             return NoteModel.fromMap(jsonValue);
//           } catch (_) {
//             return null;
//           }
//         };

//         // Assert.
//         expect(
//           result(),
//           NoteModel(
//             noteId: 1,
//             title: 'Test',
//             severity: Severity.Easy,
//             state: false,
//           ),
//         );
//       });
//       test('Incorrect Test', () async {
//         // Act.
//         final File file = File('test/data/models/note_model_artifacts/incorrect_note_model_test.JSON');
//         if (!(await file.exists())) throw Exception('File does\'t exist');

//         final String string = await file.readAsString();
//         final dynamic jsonValue = jsonDecode(string);

//         // Arrange.
//         final NoteModel? Function() result = () {
//           try {
//             return NoteModel.fromMap(jsonValue);
//           } catch (_) {
//             return null;
//           }
//         };

//         // Accert.
//         expect(result(), null);
//       });